execute store result score $get_coordinates.within_131072 iris if entity @s[distance=..0.131072]

execute if score $get_coordinates.within_131072 iris matches 0 run scoreboard players add ${z} iris 131072
execute if score $get_coordinates.within_131072 iris matches 0 positioned ~ ~ ~0.131072 run function iris:get_coordinates/z/3
execute if score $get_coordinates.within_131072 iris matches 1 run function iris:get_coordinates/z/3