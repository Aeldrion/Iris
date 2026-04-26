from collections import defaultdict
from dataclasses import asdict
import json
import os


def group_dict_keys(d: dict) -> list[list]:
    """
    Partitions keys in a dict by value, as a list of sorted lists
    Example: {"a": True, "b": False, "c": True} -> [["a", "c"], ["b"]]
    Keys must be sortable and values must be serializable as JSON
    """
    groups = defaultdict(list)

    for key, value in d.items():
        hash = json.dumps(value, default=asdict)
        groups[hash].append(key)

    return [sorted(group) for group in groups.values()]


def unnamespace(resource_id: str) -> str:
    """
    Remove the namespace from a namespaced resource ID, and adds it to the
    front if it's not 'minecraft'
    Example:
        minecraft:stone -> stone
        foo:bar -> foo_bar
    """
    namespace, name = resource_id.split(":")
    if namespace == "minecraft":
        return name
    return f"{namespace}_{name}"


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
