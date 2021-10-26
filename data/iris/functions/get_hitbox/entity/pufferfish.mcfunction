#> iris:get_hitbox/entity/pufferfish
#
# @within iris:get_hitbox/entity

execute store result score $pufferfish_puffstate iris run data get entity @s PuffState
execute if score $pufferfish_puffstate iris matches 0 run scoreboard players set $entity_half_width iris 175000
execute if score $pufferfish_puffstate iris matches 0 run scoreboard players set $entity_height iris 350000
execute if score $pufferfish_puffstate iris matches 1 run scoreboard players set $entity_half_width iris 250000
execute if score $pufferfish_puffstate iris matches 1 run scoreboard players set $entity_height iris 500000
execute if score $pufferfish_puffstate iris matches 2 run scoreboard players set $entity_half_width iris 350000
execute if score $pufferfish_puffstate iris matches 2 run scoreboard players set $entity_height iris 700000