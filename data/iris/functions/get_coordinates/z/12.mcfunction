execute store result score $get_coordinates.within_128 iris if entity @s[distance=..0.000128]

execute if score $get_coordinates.within_128 iris matches 0 run scoreboard players add ${z} iris 128
execute if score $get_coordinates.within_128 iris matches 0 positioned ~ ~ ~0.000128 run function iris:get_coordinates/z/13
execute if score $get_coordinates.within_128 iris matches 1 run function iris:get_coordinates/z/13