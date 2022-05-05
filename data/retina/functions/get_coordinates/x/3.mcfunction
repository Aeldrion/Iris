execute store success score $get_coordinates.within_65536 retina if entity @s[distance=..0.065536]

execute if score $get_coordinates.within_65536 retina matches 0 run scoreboard players add ${x} retina 65536
execute if score $get_coordinates.within_65536 retina matches 0 positioned ~0.065536 ~ ~ run function retina:get_coordinates/x/4
execute if score $get_coordinates.within_65536 retina matches 1 run function retina:get_coordinates/x/4