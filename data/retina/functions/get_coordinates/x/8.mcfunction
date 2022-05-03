execute store success score $get_coordinates.within_2048 retina if entity @s[distance=..0.002048]

execute if score $get_coordinates.within_2048 retina matches 0 run scoreboard players add ${x} retina 2048
execute if score $get_coordinates.within_2048 retina matches 0 positioned ~0.002048 ~ ~ run function retina:get_coordinates/x/9
execute if score $get_coordinates.within_2048 retina matches 1 run function retina:get_coordinates/x/9