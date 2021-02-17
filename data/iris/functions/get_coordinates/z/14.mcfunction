execute store result score $get_coordinates.within_32 iris if entity @s[distance=..0.000032]

execute if score $get_coordinates.within_32 iris matches 0 run scoreboard players add ${z} iris 32
execute if score $get_coordinates.within_32 iris matches 0 positioned ~ ~ ~0.000032 run function iris:get_coordinates/z/15
execute if score $get_coordinates.within_32 iris matches 1 run function iris:get_coordinates/z/15