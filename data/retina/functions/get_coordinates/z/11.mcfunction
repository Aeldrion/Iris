execute store result score $get_coordinates.within_256 retina if entity @s[distance=..0.000256]

execute if score $get_coordinates.within_256 retina matches 0 run scoreboard players add ${z} retina 256
execute if score $get_coordinates.within_256 retina matches 0 positioned ~ ~ ~0.000256 run function retina:get_coordinates/z/12
execute if score $get_coordinates.within_256 retina matches 1 run function retina:get_coordinates/z/12