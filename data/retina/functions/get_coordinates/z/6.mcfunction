execute store result score $get_coordinates.within_8192 retina if entity @s[distance=..0.008192]

execute if score $get_coordinates.within_8192 retina matches 0 run scoreboard players add ${z} retina 8192
execute if score $get_coordinates.within_8192 retina matches 0 positioned ~ ~ ~0.008192 run function retina:get_coordinates/z/7
execute if score $get_coordinates.within_8192 retina matches 1 run function retina:get_coordinates/z/7