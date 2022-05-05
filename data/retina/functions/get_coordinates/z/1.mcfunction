execute store result score $get_coordinates.within_262144 retina if entity @s[distance=..0.262144]

execute if score $get_coordinates.within_262144 retina matches 0 run scoreboard players add ${z} retina 262144
execute if score $get_coordinates.within_262144 retina matches 0 positioned ~ ~ ~0.262144 run function retina:get_coordinates/z/2
execute if score $get_coordinates.within_262144 retina matches 1 run function retina:get_coordinates/z/2