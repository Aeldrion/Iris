execute store success score $get_coordinates.within_8192 iris if entity @s[distance=..0.008192]

execute if score $get_coordinates.within_8192 iris matches 0 run scoreboard players add ${x} iris 8192
execute if score $get_coordinates.within_8192 iris matches 0 positioned ~0.008192 ~ ~ run function iris:get_coordinates/x/7
execute if score $get_coordinates.within_8192 iris matches 1 run function iris:get_coordinates/x/7