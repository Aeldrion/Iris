execute store result score $get_coordinates.within_128 retina if entity @s[distance=..0.000128]

execute if score $get_coordinates.within_128 retina matches 0 run scoreboard players add ${z} retina 128
execute if score $get_coordinates.within_128 retina matches 0 positioned ~ ~ ~0.000128 run function retina:get_coordinates/z/13
execute if score $get_coordinates.within_128 retina matches 1 run function retina:get_coordinates/z/13