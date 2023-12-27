scoreboard players set $entity_half_width iris 450000
scoreboard players set $entity_height iris 500000

execute store result score $phantom_size iris run data get entity @s Size
execute if score $phantom_size iris matches 0 run return 0
scoreboard players set $phantom_extra_width iris 67500
scoreboard players operation $phantom_extra_width iris *= $phantom_size iris
scoreboard players operation $entity_half_width iris += $phantom_extra_width iris
scoreboard players set $phantom_extra_height iris 75000
scoreboard players operation $phantom_extra_height iris *= $phantom_size iris
scoreboard players operation $entity_height iris += $phantom_extra_height iris
