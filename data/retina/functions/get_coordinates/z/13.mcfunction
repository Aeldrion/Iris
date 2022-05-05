execute store result score $get_coordinates.within_64 retina if entity @s[distance=..0.000064]

execute if score $get_coordinates.within_64 retina matches 0 run scoreboard players add ${z} retina 64
execute if score $get_coordinates.within_64 retina matches 0 positioned ~ ~ ~0.000064 run function retina:get_coordinates/z/14
execute if score $get_coordinates.within_64 retina matches 1 run function retina:get_coordinates/z/14