execute store success score $get_coordinates.within_64 iris if entity @s[distance=..0.000064]

execute if score $get_coordinates.within_64 iris matches 0 run scoreboard players add ${x} iris 64
execute if score $get_coordinates.within_64 iris matches 0 positioned ~0.000064 ~ ~ run function iris:get_coordinates/x/14
execute if score $get_coordinates.within_64 iris matches 1 run function iris:get_coordinates/x/14