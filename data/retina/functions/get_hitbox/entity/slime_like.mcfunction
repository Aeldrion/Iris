#> retina:get_hitbox/entity/slime_like
#
# @within retina:get_hitbox/entity

scoreboard players set $entity_half_width retina 255000
scoreboard players set $entity_height retina 510000
execute store result score $slime_size retina run data get entity @s Size
scoreboard players add $slime_size retina 1
scoreboard players operation $entity_half_width retina *= $slime_size retina
scoreboard players operation $entity_height retina *= $slime_size retina