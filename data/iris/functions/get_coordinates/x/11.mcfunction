execute store success score $get_coordinates.within_256 iris if entity @s[distance=..0.000256]

execute if score $get_coordinates.within_256 iris matches 0 run scoreboard players add ${x} iris 256
execute if score $get_coordinates.within_256 iris matches 0 positioned ~0.000256 ~ ~ run function iris:get_coordinates/x/12
execute if score $get_coordinates.within_256 iris matches 1 run function iris:get_coordinates/x/12