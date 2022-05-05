#> retina:get_hitbox/entity/pufferfish
#
# @within retina:get_hitbox/entity

execute store result score $pufferfish_puffstate retina run data get entity @s PuffState
execute if score $pufferfish_puffstate retina matches 0 run scoreboard players set $entity_half_width retina 175000
execute if score $pufferfish_puffstate retina matches 0 run scoreboard players set $entity_height retina 350000
execute if score $pufferfish_puffstate retina matches 1 run scoreboard players set $entity_half_width retina 250000
execute if score $pufferfish_puffstate retina matches 1 run scoreboard players set $entity_height retina 500000
execute if score $pufferfish_puffstate retina matches 2 run scoreboard players set $entity_half_width retina 350000
execute if score $pufferfish_puffstate retina matches 2 run scoreboard players set $entity_height retina 700000