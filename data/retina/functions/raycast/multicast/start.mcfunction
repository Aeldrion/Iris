scoreboard players set $horizontal_index retina 0
scoreboard players set $vertical_index retina 0
execute at @s run function retina:raycast/multicast/loop
execute as @e[type=marker,tag=retina.multicast] run scoreboard players operation @s retina.show_particle = @p[tag=retina.reference_player] retina.show_particle
execute as @e[type=marker,tag=retina.multicast] run scoreboard players operation @s retina.show_line = @p[tag=retina.reference_player] retina.show_line
execute as @e[type=marker,tag=retina.multicast] at @s anchored eyes positioned ^ ^ ^ run function retina:raycast/singlecast
tag @a remove retina.reference_player