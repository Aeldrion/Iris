execute store result score $get_coordinates.within_1024 retina if entity @s[distance=..0.001024]

execute if score $get_coordinates.within_1024 retina matches 0 run scoreboard players add ${z} retina 1024
execute if score $get_coordinates.within_1024 retina matches 0 positioned ~ ~ ~0.001024 run function retina:get_coordinates/z/10
execute if score $get_coordinates.within_1024 retina matches 1 run function retina:get_coordinates/z/10