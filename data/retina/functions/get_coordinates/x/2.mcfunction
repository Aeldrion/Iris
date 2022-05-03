execute store success score $get_coordinates.within_131072 retina if entity @s[distance=..0.131072]

execute if score $get_coordinates.within_131072 retina matches 0 run scoreboard players add ${x} retina 131072
execute if score $get_coordinates.within_131072 retina matches 0 positioned ~0.131072 ~ ~ run function retina:get_coordinates/x/3
execute if score $get_coordinates.within_131072 retina matches 1 run function retina:get_coordinates/x/3