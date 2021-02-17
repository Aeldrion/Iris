execute store result score $get_coordinates.within_8 iris if entity @s[distance=..0.000008]

execute if score $get_coordinates.within_8 iris matches 0 run scoreboard players add ${z} iris 8
execute if score $get_coordinates.within_8 iris matches 0 positioned ~ ~ ~0.000008 run function iris:get_coordinates/z/17
execute if score $get_coordinates.within_8 iris matches 1 run function iris:get_coordinates/z/17