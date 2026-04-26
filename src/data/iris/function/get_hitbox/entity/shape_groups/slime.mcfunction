import json
with open("resources/entity_types.json") as entities_file:
    entity_dimension_data = json.load(entities_file)
    width = int(1e6 * entity_dimension_data["minecraft:slime"]["width"])
    height = int(1e6 * entity_dimension_data["minecraft:slime"]["height"])
scoreboard players set $entity_width iris width
scoreboard players set $entity_height iris height
execute store result score $slime_size iris run data get entity @s Size
scoreboard players add $slime_size iris 1
scoreboard players operation $entity_width iris *= $slime_size iris
scoreboard players operation $entity_height iris *= $slime_size iris
