execute store success score $get_coordinates.within_16384 retina if entity @s[distance=..0.016384]

execute if score $get_coordinates.within_16384 retina matches 0 run scoreboard players add ${x} retina 16384
execute if score $get_coordinates.within_16384 retina matches 0 positioned ~0.016384 ~ ~ run function retina:get_coordinates/x/6
execute if score $get_coordinates.within_16384 retina matches 1 run function retina:get_coordinates/x/6