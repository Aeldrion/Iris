execute store result score $get_coordinates.within_4096 iris if entity @s[distance=..0.004096]

execute if score $get_coordinates.within_4096 iris matches 0 run scoreboard players add ${z} iris 4096
execute if score $get_coordinates.within_4096 iris matches 0 positioned ~ ~ ~0.004096 run function iris:get_coordinates/z/8
execute if score $get_coordinates.within_4096 iris matches 1 run function iris:get_coordinates/z/8