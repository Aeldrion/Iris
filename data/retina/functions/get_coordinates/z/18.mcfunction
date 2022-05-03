execute store result score $get_coordinates.within_2 retina if entity @s[distance=..0.000002]

execute if score $get_coordinates.within_2 retina matches 0 run scoreboard players add ${z} retina 2
execute if score $get_coordinates.within_2 retina matches 0 positioned ~ ~ ~0.000002 unless entity @s[distance=..0.000001] run scoreboard players add ${z} retina 1
execute if score $get_coordinates.within_2 retina matches 1 unless entity @s[distance=..0.000001] run scoreboard players add ${z} retina 1