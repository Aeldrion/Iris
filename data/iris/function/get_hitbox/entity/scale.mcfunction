#> iris:get_hitbox/entity/scale
#
# Scales a living entity according to its generic.scale attribute
#
# @within iris:get_hitbox/entity

execute store result score $attribute_scale iris run attribute @s generic.scale get 1000
execute if score $attribute_scale iris matches 0 run return fail
execute if score $attribute_scale iris matches 1000 run return 0

scoreboard players operation $entity_width iris /= $10 iris
scoreboard players operation $entity_width iris *= $attribute_scale iris
scoreboard players operation $entity_width iris /= $100 iris

scoreboard players operation $entity_height iris /= $10 iris
scoreboard players operation $entity_height iris *= $attribute_scale iris
scoreboard players operation $entity_height iris /= $100 iris
