execute store result score $get_coordinates.within_4 iris if entity @s[distance=..0.000004]

execute if score $get_coordinates.within_4 iris matches 0 run scoreboard players add ${z} iris 4
execute if score $get_coordinates.within_4 iris matches 0 positioned ~ ~ ~0.000004 run function iris:get_coordinates/z/18
execute if score $get_coordinates.within_4 iris matches 1 run function iris:get_coordinates/z/18