#!/usr/bin/python3

from urllib.request import urlopen
from collections import defaultdict
import json, os, sys

LINK_LOCAL = "1_20_1_blocks.json"
LINK_HTTPS = "https://raw.githubusercontent.com/Articdive/ArticData/1.20.1/1_20_1_blocks.json" #TODO replace this link with something more permanent and more up to date
BLOCK_TAG_PATH = "data/iris/tags/blocks"
FUNCTION_PATH = "data/iris/functions/get_hitbox"
DIRS = [f"{BLOCK_TAG_PATH}/tree", f"{BLOCK_TAG_PATH}/shape_groups", f"{FUNCTION_PATH}/block/tree"]
OVERRIDES = {"minecraft:grass": "minecraft:short_grass"} # A quick hack for outdated block info until I have something cleaner

ONLINE = True
PARTITION_SUBSETS = 5

def group_keys_by_value(d: dict) -> list[list]:
    """
    Creates a 2D array where all keys with the same value in d are grouped together
    Values are not guaranteed to be hashable
    """
    groups = defaultdict(list)

    for key, value in d.items():
        hash = json.dumps(value)
        groups[hash].append(key)

    return [sorted(group) for group in groups.values()]

def get_relevant_block_information(block_info: dict) -> dict:
    """Remove all block information not related to hitboxes"""

    # Only remember block states and corresponding shapes
    new_block_info = {}
    new_block_info["states"] = []
    for state in block_info["states"]:
        new_block_info["states"].append({
            "properties": state["properties"],
            "shape": state["shape"]
        })
    
    # Ignore block state properties that do not affect block shape
    # A property = age/facing/half... - a block state = a map of properties and their values, and the information for the shape of the corresponding block
    block_state_properties = list(block_info["states"][0]["properties"].keys())
    for property in block_state_properties:
        property_values = set(state["properties"][property] for state in new_block_info["states"])
        shapes = {}
        for value in property_values:
            shapes[value] = [state["shape"] for state in new_block_info["states"] if state["properties"][property] == value]
        first_shape = next(iter(shapes.values()))
        if all(shape == first_shape for shape in shapes.values()):
            # If this property does not affect block shape, remove this property from states but remove duplicates
            property_value_representative = list(property_values)[0]
            new_block_info["states"] = [state for state in new_block_info["states"] if state["properties"][property] == property_value_representative]
            for state in new_block_info["states"]:
                state["properties"].pop(property)

    return new_block_info

def get_representative(list) -> str:
    """Returns the unnamespaced representative of a shape group"""
    return group[0][len("minecraft:"):]

def to_snbt(s: str):
    """Converts a shape of the form [AABB[x, y, z] -> [x, y, z]] into the SNBT string of the form [{min: [x, y, z], max: [x, y, z]}]"""
    bounding_boxes = eval(s
                            .replace("AABB", '(')
                            .replace(', (', '), (')
                            .replace(' ->', ',')
                            .replace(']]', '])]')
                        )
    snbt_string = ','.join([
        f"{{min: {min_corner}, max: {max_corner}}}" for min_corner, max_corner in bounding_boxes
    ])
    return f"[{snbt_string}]"

if __name__ == "__main__":
    # Create required data pack directories
    for dir in DIRS:
        os.makedirs(dir, exist_ok=True)

    # Read block data
    print("Reading block data...")
    with (urlopen(LINK_HTTPS) if ONLINE else open(LINK_LOCAL)) as file:
        block_data = json.load(file)
    for block in block_data:
        block_data[block] = get_relevant_block_information(block_data[block])

    # Group blocks with identical shapes together
    block_shape_groups = group_keys_by_value(block_data)
    print(f"Found {len(block_data)} blocks with {len(block_shape_groups)} unique shapes")
    block_data = {group[0]: block_data[group[0]] for group in block_shape_groups}

    # Generate block tag files for every shape group with at least two blocks
    for group in block_shape_groups:
        if len(group)==1:
            continue
        values = [{
            "id": OVERRIDES.get(id_) or id_,
            "required": False
        } for id_ in group]
        with open(f"{BLOCK_TAG_PATH}/shape_groups/{get_representative(group)}.json", mode='w') as block_tag_file:
            json.dump({"values": values}, block_tag_file, indent=4)

    # Generate function files for every shape group
    for group in block_shape_groups:
        namespaced_representative = group[0]
        block_id = ("#iris:shape_groups/" + get_representative(group)) if len(group)>1 else namespaced_representative
        mcfunction_file_path = f"{FUNCTION_PATH}/block/{get_representative(group)}.mcfunction"
        with open(mcfunction_file_path, mode='w') as mcfunction_file:
            for state in block_data[namespaced_representative]["states"]:
                # Write 'execute if block' condition, unless there is no state to observe
                block_state = state["properties"]
                if block_state != {}:
                    block_state_predicate = '[' + ', '.join(
                            map(lambda prop: "{}={}".format(prop, str(block_state[prop]).lower()), block_state.keys())
                        ) + ']'
                    block_predicate = f"{block_id}{block_state_predicate}"
                    execute_command = f"execute if block ~ ~ ~ {block_predicate} run "
                else:
                    execute_command = ""

                # Write 'data modify' command
                snbt = to_snbt(state["shape"])
                data_command = f"data modify storage iris:data Shape set value {snbt}"

                # Write full command to function
                command = f"{execute_command}{data_command}\n"
                mcfunction_file.write(command)

    # Generate block tags and functions for faster shape group lookup
    groups_per_tag = - (-len(block_shape_groups) // PARTITION_SUBSETS)
    for i in range(PARTITION_SUBSETS):
        tag_values = []
        commands = []
        for group in block_shape_groups[i*groups_per_tag : (i+1)*groups_per_tag]:
            if len(group) > 1:
                repr = get_representative(group)
                tag_values.append(f"#iris:shape_groups/{repr}")
                commands.append(f"execute if block ~ ~ ~ #iris:shape_groups/{repr} run function iris:get_hitbox/block/{repr}")
            else:
                tag_values.append(group[0])
                commands.append(f"execute if block ~ ~ ~ {group[0]} run function iris:get_hitbox/block/{get_representative(group)}")
        with open(f"{BLOCK_TAG_PATH}/tree/{i}.json", mode='w') as block_tag_file:
            json.dump({"values": [{"id": value, "required": False} for value in tag_values]}, block_tag_file, indent=4)
        with open(f"{FUNCTION_PATH}/block/tree/{i}.mcfunction", mode='w') as function_file:
            function_file.write('\n'.join(commands))

    # Generate master function
    with open(f"{FUNCTION_PATH}/block.mcfunction", mode='w') as function_file:
        print(f"Writing commands to {function_file.name}")

        HEADER = """#> iris:get_hitbox/block
#
# Returns a list of surfaces of the current blockg
#
# @within iris:raycast/on_block_found
# @output
#	storage iris:data Shape: compound[]
#       A list of cuboids given by two corners in the format {min: [x, y, z], max: [x, y z]}
"""

        commands = []
        for i in range(PARTITION_SUBSETS):
            commands.append(f"execute if block ~ ~ ~ #iris:tree/{i} run return run function iris:get_hitbox/block/tree/{i}")
        function_file.write(HEADER + '\n')
        function_file.write('\n'.join(commands) + '\n')

    if "--debug" in sys.argv:
        for group in block_shape_groups:
            if len(group)==1:
                continue
            block_data[group[0]]["aliases"] = group[1:]
        with open("block_hitboxes.json", mode='w') as block_hitbox_file:
            print(f"Writing hitbox information to {block_hitbox_file.name}")
            json.dump(block_data, block_hitbox_file, indent=2)