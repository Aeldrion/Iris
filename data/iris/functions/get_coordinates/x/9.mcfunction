execute store success score $get_coordinates.within_1024 iris if entity @s[distance=..0.001024]

execute if score $get_coordinates.within_1024 iris matches 0 run scoreboard players add ${x} iris 1024
execute if score $get_coordinates.within_1024 iris matches 0 positioned ~0.001024 ~ ~ run function iris:get_coordinates/x/10
execute if score $get_coordinates.within_1024 iris matches 1 run function iris:get_coordinates/x/10