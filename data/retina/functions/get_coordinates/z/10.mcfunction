execute store result score $get_coordinates.within_512 retina if entity @s[distance=..0.000512]

execute if score $get_coordinates.within_512 retina matches 0 run scoreboard players add ${z} retina 512
execute if score $get_coordinates.within_512 retina matches 0 positioned ~ ~ ~0.000512 run function retina:get_coordinates/z/11
execute if score $get_coordinates.within_512 retina matches 1 run function retina:get_coordinates/z/11