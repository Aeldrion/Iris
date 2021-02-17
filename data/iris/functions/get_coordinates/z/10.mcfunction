execute store result score $get_coordinates.within_512 iris if entity @s[distance=..0.000512]

execute if score $get_coordinates.within_512 iris matches 0 run scoreboard players add ${z} iris 512
execute if score $get_coordinates.within_512 iris matches 0 positioned ~ ~ ~0.000512 run function iris:get_coordinates/z/11
execute if score $get_coordinates.within_512 iris matches 1 run function iris:get_coordinates/z/11