execute store result score $pufferfish_puffstate iris run data get entity @s PuffState
execute if score $pufferfish_puffstate iris matches 0 run scoreboard players set $entity_width iris 350000
execute if score $pufferfish_puffstate iris matches 1 run scoreboard players set $entity_width iris 500000
execute if score $pufferfish_puffstate iris matches 2 run scoreboard players set $entity_width iris 700000
scoreboard players operation $entity_height iris = $entity_width iris

