execute store success score $get_coordinates.within_32768 retina if entity @s[distance=..0.032768]

execute if score $get_coordinates.within_32768 retina matches 0 run scoreboard players add ${x} retina 32768
execute if score $get_coordinates.within_32768 retina matches 0 positioned ~0.032768 ~ ~ run function retina:get_coordinates/x/5
execute if score $get_coordinates.within_32768 retina matches 1 run function retina:get_coordinates/x/5