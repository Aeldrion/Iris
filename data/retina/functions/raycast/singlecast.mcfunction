function retina:get_target
execute at @e[type=minecraft:marker, tag=retina.ray] if block ~ ~ ~ minecraft:gold_block run scoreboard players set @s looking_at_gold 1
execute at @e[type=minecraft:marker, tag=retina.ray] unless block ~ ~ ~ minecraft:gold_block run scoreboard players set @s looking_at_gold 0
# scoreboard players set $temp retina.show_particle 0
execute as @e[type=minecraft:marker, tag=retina.ray] run function retina:set_coordinates
scoreboard players operation @e[type=minecraft:marker, tag=retina.ray, limit=1] retina.show_particle = @s retina.show_particle
execute as @e[type=minecraft:marker, tag=retina.ray] unless score @s retina.show_particle matches 0 at @s run function retina:display_particle
execute unless score @s retina.show_line matches 0 at @s run function retina:raycast/draw_line
execute if entity @s[type=marker,tag=retina.multicast] run kill @s
execute if entity @s[type=marker,tag=retina.randomcast] run kill @s