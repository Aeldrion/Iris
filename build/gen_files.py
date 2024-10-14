#!/usr/bin/python3

import json
import sys
import getopt

try:
    from tqdm import tqdm
except ImportError:
    tqdm = lambda f, _: f

from util import unnamespace, group_dict_keys, make_tag, make_function, shape_to_snbt

ONLINE = True
PARTITION_SUBSETS = 5

# Entities with variable sizes, for which not to override functions
SPECIAL_ENTITIES = [
    "minecraft:armor_stand",
    "minecraft:magma_cube",
    "minecraft:phantom",
    "minecraft:pufferfish",
    "minecraft:slime",
]

# Blocks locked behind experimental features; only needs to contain blocks that are unique in their own shape groups
EXPERIMENTAL_BLOCKS = [
    "minecraft:pale_moss_carpet",
    "minecraft:pale_hanging_moss"
]


def remove_useless_properties(block: dict) -> dict:
    """Remove block state properties that do not affect the shape of a block, e.g. waterlogged"""
    properties = list(block["states"][0]["properties"].keys())
    for property in properties:
        values = set(state["properties"][property] for state in block["states"])
        shapes = {}
        for value in values:
            shapes[value] = [
                state["shape"]
                for state in block["states"]
                if state["properties"][property] == value
            ]
        first_shape = next(iter(shapes.values()))
        if all(shape == first_shape for shape in shapes.values()):
            # If this property does not affect block shape, remove this property from states, and remove duplicates
            first_value = list(values)[0]
            block["states"] = [
                state
                for state in block["states"]
                if state["properties"][property] == first_value
            ]
            for state in block["states"]:
                state["properties"].pop(property)

    return block


def generate_block_hitboxes(filename: str) -> None:
    print("Reading block data...")
    with open(filename) as file:
        block_data = json.load(file)
    for block in block_data:
        block_data[block] = remove_useless_properties(block_data[block])

    # Group blocks with identical shapes together
    block_shape_groups = group_dict_keys(block_data)
    print(
        f"Found {len(block_data)} blocks with {len(block_shape_groups)} unique shapes"
    )
    block_data = {group[0]: block_data[group[0]] for group in block_shape_groups}

    def get_group_id(group: list[str]):
        representative = group[0]
        name = unnamespace(representative)
        if len(group) > 1:
            return f"#iris:shape_groups/{name}"
        if representative in EXPERIMENTAL_BLOCKS:
            return f"#iris:experiments/{name}"
        return representative

    # Generate block tag files for every shape group with at least two blocks
    for group in block_shape_groups:
        if len(group) > 1:
            make_tag(group, f"{BLOCK_TAG_PATH}/shape_groups")
        elif group[0] in EXPERIMENTAL_BLOCKS:
            make_tag(group, f"{BLOCK_TAG_PATH}/experiments")

    # Generate function files for every shape group
    for group in tqdm(block_shape_groups, "Generating block functions"):
        block_id = get_group_id(group)

        commands = []
        for state in block_data[group[0]]["states"]:
            # Write 'execute if block' condition, unless there is no state to observe
            block_state = state["properties"]
            if block_state != {}:
                block_state_predicate = (
                    "["
                    + ", ".join(
                        map(
                            lambda prop: "{}={}".format(
                                prop, str(block_state[prop]).lower()
                            ),
                            block_state.keys(),
                        )
                    )
                    + "]"
                )
                block_predicate = f"{block_id}{block_state_predicate}"
                execute_command = f"execute if block ~ ~ ~ {block_predicate} run "
            else:
                execute_command = ""

            # Write 'data modify' command
            snbt = shape_to_snbt(state["shape"])
            data_command = f"data modify storage iris:data Shape set value {snbt}"

            # Write full command to function
            command = f"{execute_command}{data_command}"
            commands.append(command)

        make_function(
            commands, f"{FUNCTION_PATH}/block/shape_groups", unnamespace(group[0])
        )

    # Generate block tags and functions for faster shape group lookup
    groups_per_tag = -(-len(block_shape_groups) // PARTITION_SUBSETS)
    for i in range(PARTITION_SUBSETS):
        values = []
        commands = []

        for group in block_shape_groups[i * groups_per_tag : (i + 1) * groups_per_tag]:
            block_id = get_group_id(group)
            values.append(block_id)
            commands.append(
                f"execute if block ~ ~ ~ {block_id} "
                f"run function iris:get_hitbox/block/shape_groups/{unnamespace(group[0])}"
            )

        make_tag(values, f"{BLOCK_TAG_PATH}/tree", name=str(i), required=False)
        make_function(commands, f"{FUNCTION_PATH}/block/tree", str(i))

    # Generate master function
    HEADER = """#> iris:get_hitbox/block
#
# Returns the shape of the current block
#
# @within iris:raycast/test_for_block
# @output
#	storage iris:data Shape: compound[]
#       A list of cuboids given by two corners in the format {min: [x, y, z], max: [x, y z]}
"""

    commands = []
    for i in range(PARTITION_SUBSETS):
        commands.append(
            f"execute if block ~ ~ ~ #iris:tree/{i} run function iris:get_hitbox/block/tree/{i}"
        )
    commands.append(
        "execute if block ~ ~ ~ #iris:has_block_offset run function iris:get_hitbox/block/offset"
    )
    make_function(commands, FUNCTION_PATH, "block", header=HEADER)


def generate_entity_hitboxes(filename: str) -> None:
    print("Reading entity data...")
    with open(filename) as file:
        entity_data = json.load(file)
    entity_data = {
        key: entity_data[key]
        for key in entity_data
        if entity_data[key]["width"] > 0 and entity_data[key]["height"] > 0
    }

    # Group entities with identical hitboxes together
    entity_hitbox_groups = group_dict_keys(entity_data)
    print(
        f"Found {len(entity_data)} entities with {len(entity_hitbox_groups)} unique hitboxes"
    )
    entity_data = {group[0]: entity_data[group[0]] for group in entity_hitbox_groups}

    # Generate entity type tag files for every hitbox group with at least two entities
    for group in entity_hitbox_groups:
        if len(group) > 1:
            make_tag(group, f"{ENTITY_TAG_PATH}/shape_groups")

    # Generate function files for every hitbox group
    for group in tqdm(entity_hitbox_groups, "Generating entity functions"):
        if any([id_ in SPECIAL_ENTITIES for id_ in group]):
            continue
        width = entity_data[group[0]]["width"]
        height = entity_data[group[0]]["height"]
        commands = [
            f"scoreboard players set $entity_width iris {int(1e6*width)}",
            f"scoreboard players set $entity_height iris {int(1e6*height)}",
        ]
        make_function(
            commands, f"{FUNCTION_PATH}/entity/shape_groups", unnamespace(group[0])
        )

    # Generate block tags and functions for faster shape group lookup
    groups_per_tag = -(-len(entity_hitbox_groups) // PARTITION_SUBSETS)
    for i in range(PARTITION_SUBSETS):
        tag_values = []
        commands = []
        for group in entity_hitbox_groups[
            i * groups_per_tag : (i + 1) * groups_per_tag
        ]:
            representative = unnamespace(group[0])
            if len(group) > 1:
                tag_values.append(f"#iris:shape_groups/{representative}")
                commands.append(
                    f"execute if entity @s[type=#iris:shape_groups/{representative}] "
                    f"run function iris:get_hitbox/entity/shape_groups/{representative}"
                )
            else:
                tag_values.append(group[0])
                commands.append(
                    f"execute if entity @s[type={group[0]}] "
                    f"run function iris:get_hitbox/entity/shape_groups/{representative}"
                )
        make_function(commands, f"{FUNCTION_PATH}/entity/tree", str(i))
        make_tag(tag_values, f"{ENTITY_TAG_PATH}/tree", name=str(i), required=False)


if __name__ == "__main__":
    namespace = "iris"
    entity_shapes_path = ""
    block_shapes_path = ""
    version = None

    options, args = getopt.getopt(
        sys.argv[1:], "b:e:n:v:", ["blocks=", "entities=", "namespace=", "version="]
    )

    for name, value in options:
        if name in ["-e", "--entities"]:
            entity_shapes_path = value
        elif name in ["-b", "--blocks"]:
            block_shapes_path = value
        elif name in ["-v", "--version"]:
            try:
                version = int(value)
                assert version >= 26
            except:
                print("Invalid or unsupported data pack format")
                exit()
        elif name in ["-n", "--namespace"]:
            namespace = value

    if version is None:
        print("Missing data pack format")
        exit()

    if not (block_shapes_path or entity_shapes_path):
        print("Missing shape information")
        exit()

    TAG_PATH = f"data/{namespace}/tags"
    BLOCK_TAG_PATH = f"{TAG_PATH}/block" + ("s" if version < 43 else "")
    ENTITY_TAG_PATH = f"{TAG_PATH}/entity_type" + ("s" if version < 43 else "")
    FUNCTION_PATH = (
        f"data/{namespace}/function" + ("s" if version < 45 else "") + "/get_hitbox"
    )

    if block_shapes_path:
        generate_block_hitboxes(block_shapes_path)
    if entity_shapes_path:
        generate_entity_hitboxes(entity_shapes_path)
    if not (block_shapes_path or entity_shapes_path):
        print("Missing shape information")
