execute store success score $get_coordinates.within_262144 retina if entity @s[distance=..0.262144]

execute if score $get_coordinates.within_262144 retina matches 0 run scoreboard players add ${x} retina 262144
execute if score $get_coordinates.within_262144 retina matches 0 positioned ~0.262144 ~ ~ run function retina:get_coordinates/x/2
execute if score $get_coordinates.within_262144 retina matches 1 run function retina:get_coordinates/x/2