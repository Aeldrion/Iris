execute store result score $get_coordinates.within_262144 iris if entity @s[distance=..0.262144]

execute if score $get_coordinates.within_262144 iris matches 0 run scoreboard players add ${z} iris 262144
execute if score $get_coordinates.within_262144 iris matches 0 positioned ~ ~ ~0.262144 run function iris:get_coordinates/z/2
execute if score $get_coordinates.within_262144 iris matches 1 run function iris:get_coordinates/z/2