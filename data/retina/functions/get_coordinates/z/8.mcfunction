execute store result score $get_coordinates.within_2048 retina if entity @s[distance=..0.002048]

execute if score $get_coordinates.within_2048 retina matches 0 run scoreboard players add ${z} retina 2048
execute if score $get_coordinates.within_2048 retina matches 0 positioned ~ ~ ~0.002048 run function retina:get_coordinates/z/9
execute if score $get_coordinates.within_2048 retina matches 1 run function retina:get_coordinates/z/9