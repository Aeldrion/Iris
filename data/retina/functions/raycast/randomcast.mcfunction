tag @s add retina.reference_player
execute positioned ^ ^ ^ run summon marker ^ ^ ^ {Tags:["retina.randomcast","retina.rotate"]}
#execute as @e[type=marker,limit=1,tag=retina.rotate] run tp @s ^ ^ ^ facing entity @a[tag=retina.reference_player,sort=nearest,limit=1]
execute as @e[type=marker,limit=1,tag=retina.rotate] store result entity @s Rotation[0] float 0.01 run data get entity @a[tag=retina.reference_player,sort=nearest,limit=1] Rotation[0] 100
execute as @e[type=marker,limit=1,tag=retina.rotate] store result entity @s Rotation[1] float 0.01 run data get entity @a[tag=retina.reference_player,sort=nearest,limit=1] Rotation[1] 100

scoreboard players operation $min random = $spread_min retina
scoreboard players operation $max random = $spread_max retina 

execute if score $spread_enabled_local retina matches 1 run function random:uniform
execute if score $spread_enabled_local retina matches 1 run scoreboard players operation $random_offset_h retina = $out random
execute if score $spread_enabled_local retina matches 1 run function random:uniform
execute if score $spread_enabled_local retina matches 1 run scoreboard players operation $random_offset_v retina = $out random

execute store result score $horizontal_temp_rotation retina run data get entity @e[type=marker,tag=retina.rotate,limit=1] Rotation[0] 10
execute store result score $spread_sign_h retina if predicate random:coin_toss
execute if score $spread_sign_h retina matches 0 run scoreboard players operation $horizontal_temp_rotation retina -= $random_offset_h retina
execute if score $spread_sign_h retina matches 1 run scoreboard players operation $horizontal_temp_rotation retina += $random_offset_h retina
execute store result entity @e[type=marker,tag=retina.rotate,limit=1] Rotation[0] float 0.1 run scoreboard players get $horizontal_temp_rotation retina

execute store result score $vertical_temp_rotation retina run data get entity @e[type=marker,tag=retina.rotate,limit=1] Rotation[1] 10
execute store result score $spread_sign_v retina if predicate random:coin_toss
execute if score $spread_sign_v retina matches 0 run scoreboard players operation $vertical_temp_rotation retina -= $random_offset_v retina
execute if score $spread_sign_v retina matches 1 run scoreboard players operation $vertical_temp_rotation retina += $random_offset_v retina
execute store result entity @e[type=marker,tag=retina.rotate,limit=1] Rotation[1] float 0.1 run scoreboard players get $vertical_temp_rotation retina

execute as @e[type=marker,tag=retina.randomcast] run scoreboard players operation @s retina.show_particle = @p[tag=retina.reference_player] retina.show_particle
execute as @e[type=marker,tag=retina.randomcast] run scoreboard players operation @s retina.show_line = @p[tag=retina.reference_player] retina.show_line
tag @s remove retina.reference_player
execute as @e[type=marker,tag=retina.randomcast] at @s run function retina:raycast/singlecast
