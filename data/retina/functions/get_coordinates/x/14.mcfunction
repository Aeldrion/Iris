execute store success score $get_coordinates.within_32 retina if entity @s[distance=..0.000032]

execute if score $get_coordinates.within_32 retina matches 0 run scoreboard players add ${x} retina 32
execute if score $get_coordinates.within_32 retina matches 0 positioned ~0.000032 ~ ~ run function retina:get_coordinates/x/15
execute if score $get_coordinates.within_32 retina matches 1 run function retina:get_coordinates/x/15