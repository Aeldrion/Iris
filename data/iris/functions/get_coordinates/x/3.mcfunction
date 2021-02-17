execute store success score $get_coordinates.within_65536 iris if entity @s[distance=..0.065536]

execute if score $get_coordinates.within_65536 iris matches 0 run scoreboard players add ${x} iris 65536
execute if score $get_coordinates.within_65536 iris matches 0 positioned ~0.065536 ~ ~ run function iris:get_coordinates/x/4
execute if score $get_coordinates.within_65536 iris matches 1 run function iris:get_coordinates/x/4