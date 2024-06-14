from collections import defaultdict
import json, os


def shape_to_snbt(s: str) -> str:
    """Converts a shape of the form [AABB[x, y, z] -> [x, y, z]] into an SNBT string of the form [{min: [x, y, z], max: [x, y, z]}]"""
    bounding_boxes = eval(
        s.replace("AABB", "(")
        .replace(", (", "), (")
        .replace(" ->", ",")
        .replace("]]", "])]")
    )
    snbt_string = ",".join(
        [
            f"{{min: {min_corner}, max: {max_corner}}}"
            for min_corner, max_corner in bounding_boxes
        ]
    )
    return f"[{snbt_string}]"


def group_dict_keys(d: dict) -> list[list]:
    """
    Creates a 2D array where all keys with the same value in d are grouped together
    Values are not guaranteed to be hashable
    """
    groups = defaultdict(list)

    for key, value in d.items():
        hash = json.dumps(value)
        groups[hash].append(key)

    return [sorted(group) for group in groups.values()]


def unnamespace(id_: str) -> str:
    """Remove the namespace from a Minecraft namespaced ID"""
    return id_.split(":")[1]


def make_tag(values: list[str], path: str, name=None, required=True) -> None:
    """
    Creates a tag file at the given path with the given values
    If no name is provided, the first value is used for the tag name
    """

    if name is None:
        name = unnamespace(values[0])

    contents = [{"id": id_, "required": False} for id_ in values]

    os.makedirs(path, exist_ok=True)
    with open(f"{path}/{name}.json", mode="w") as tag_file:
        if required:
            json.dump({"values": contents}, tag_file, indent=4)
        else:
            json.dump(
                {"values": [{"id": id_, "required": False} for id_ in values]},
                tag_file,
                indent=4,
            )


def make_function(commands: list[str], path: str, name: str, header: str = "") -> None:
    """Creates a fucntion file at the given path with the given commands"""

    os.makedirs(path, exist_ok=True)
    with open(f"{path}/{name}.mcfunction", mode="w") as function_file:
        if header:
            function_file.write(header + "\n")
        for command in commands:
            function_file.write(command + "\n")
