execute store success score $get_coordinates.within_4 iris if entity @s[distance=..0.000004]

execute if score $get_coordinates.within_4 iris matches 0 run scoreboard players add ${x} iris 4
execute if score $get_coordinates.within_4 iris matches 0 positioned ~0.000004 ~ ~ run function iris:get_coordinates/x/18
execute if score $get_coordinates.within_4 iris matches 1 run function iris:get_coordinates/x/18