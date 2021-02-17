execute store result score $get_coordinates.within_16 iris if entity @s[distance=..0.000016]

execute if score $get_coordinates.within_16 iris matches 0 run scoreboard players add ${z} iris 16
execute if score $get_coordinates.within_16 iris matches 0 positioned ~ ~ ~0.000016 run function iris:get_coordinates/z/16
execute if score $get_coordinates.within_16 iris matches 1 run function iris:get_coordinates/z/16