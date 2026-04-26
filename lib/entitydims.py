import json
from dataclasses import dataclass

from lib.util import group_dict_keys


@dataclass
class EntityDimensions:
    width: float
    height: float


special_entity_types = [
    "minecraft:armor_stand",
    "minecraft:magma_cube",
    "minecraft:phantom",
    "minecraft:player",
    "minecraft:pufferfish",
    "minecraft:slime",
    "minecraft:sulfur_cube",
]


def get_entity_dimensions(filename: str) -> ([[str]], dict[str, (float, float)]):
    global special_entity_types

    with open(filename) as entities_file:
        entity_data = json.load(
            entities_file,
            object_hook=(
                lambda s: (
                    EntityDimensions(s["width"], s["height"])
                    if ("width" in s and "height" in s)
                    else s
                )
            ),
        )

    # Remove special entities not found in the file
    special_entity_types = list(
        filter(lambda entity_type: entity_type in entity_data, special_entity_types)
    )

    # Filter out entities with no hitboxes and special entities
    entity_data = {
        key: entity_data[key]
        for key in entity_data
        if key not in special_entity_types
        and entity_data[key].width > 0
        and entity_data[key].height > 0
    }

    entity_size_groups = group_dict_keys(entity_data)
    entity_dimensions = {
        group[0]: entity_data[group[0]] for group in entity_size_groups
    }
    entity_size_groups += [[entity_type] for entity_type in special_entity_types]

    return entity_size_groups, entity_dimensions
