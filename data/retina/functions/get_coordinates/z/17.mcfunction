execute store result score $get_coordinates.within_4 retina if entity @s[distance=..0.000004]

execute if score $get_coordinates.within_4 retina matches 0 run scoreboard players add ${z} retina 4
execute if score $get_coordinates.within_4 retina matches 0 positioned ~ ~ ~0.000004 run function retina:get_coordinates/z/18
execute if score $get_coordinates.within_4 retina matches 1 run function retina:get_coordinates/z/18