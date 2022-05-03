execute unless entity @e[type=marker,tag=retina.line] at @s anchored eyes run summon marker ^ ^ ^0.2 {Tags:["retina.line"]}
execute if entity @e[type=marker,tag=retina.line] at @s anchored eyes run tp @e[type=marker,tag=retina.line] ^ ^ ^0.2
scoreboard players operation @e[type=minecraft:marker, tag=retina.line, limit=1] retina.show_line = @s retina.show_line
execute as @e[type=marker,tag=retina.line] at @s anchored eyes run tp @s ^ ^ ^ facing entity @e[type=marker,tag=retina.ray, limit=1] feet
execute as @e[type=marker,tag=retina.line] at @s anchored eyes positioned ^ ^ ^ anchored feet run function retina_vdv:start_ray
# tellraw @a "line drawing attempted"
