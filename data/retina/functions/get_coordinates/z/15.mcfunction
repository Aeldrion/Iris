execute store result score $get_coordinates.within_16 retina if entity @s[distance=..0.000016]

execute if score $get_coordinates.within_16 retina matches 0 run scoreboard players add ${z} retina 16
execute if score $get_coordinates.within_16 retina matches 0 positioned ~ ~ ~0.000016 run function retina:get_coordinates/z/16
execute if score $get_coordinates.within_16 retina matches 1 run function retina:get_coordinates/z/16