execute store result score $get_coordinates.within_8 retina if entity @s[distance=..0.000008]

execute if score $get_coordinates.within_8 retina matches 0 run scoreboard players add ${z} retina 8
execute if score $get_coordinates.within_8 retina matches 0 positioned ~ ~ ~0.000008 run function retina:get_coordinates/z/17
execute if score $get_coordinates.within_8 retina matches 1 run function retina:get_coordinates/z/17