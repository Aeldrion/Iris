execute store success score $get_coordinates.within_16 iris if entity @s[distance=..0.000016]

execute if score $get_coordinates.within_16 iris matches 0 run scoreboard players add ${x} iris 16
execute if score $get_coordinates.within_16 iris matches 0 positioned ~0.000016 ~ ~ run function iris:get_coordinates/x/16
execute if score $get_coordinates.within_16 iris matches 1 run function iris:get_coordinates/x/16