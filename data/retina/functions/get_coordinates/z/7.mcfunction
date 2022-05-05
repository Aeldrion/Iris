execute store result score $get_coordinates.within_4096 retina if entity @s[distance=..0.004096]

execute if score $get_coordinates.within_4096 retina matches 0 run scoreboard players add ${z} retina 4096
execute if score $get_coordinates.within_4096 retina matches 0 positioned ~ ~ ~0.004096 run function retina:get_coordinates/z/8
execute if score $get_coordinates.within_4096 retina matches 1 run function retina:get_coordinates/z/8