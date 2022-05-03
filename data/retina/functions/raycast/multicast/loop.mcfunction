tag @s add retina.reference_player
execute positioned ^ ^ ^ anchored eyes run summon marker ^ ^ ^ {Tags:["retina.multicast","retina.rotate"]}
#execute as @e[type=marker,limit=1,tag=retina.rotate] run tp @s ^ ^ ^ facing entity @a[tag=retina.reference_player,sort=nearest,limit=1]
execute as @e[type=marker,limit=1,tag=retina.rotate] store result entity @s Rotation[0] float 0.01 run data get entity @a[tag=retina.reference_player,sort=nearest,limit=1] Rotation[0] 100
execute as @e[type=marker,limit=1,tag=retina.rotate] store result entity @s Rotation[1] float 0.01 run data get entity @a[tag=retina.reference_player,sort=nearest,limit=1] Rotation[1] 100

scoreboard players set $random_offset_h retina 10
scoreboard players set $random_offset_v retina 10

scoreboard players operation $min random = $spread_min retina
scoreboard players operation $max random = $spread_max retina 

execute if score $spread_enabled_global retina matches 1 if score $spread_enabled_local retina matches 1 run function random:uniform
execute if score $spread_enabled_global retina matches 1 if score $spread_enabled_local retina matches 1 run scoreboard players operation $random_offset_h retina = $out random
execute if score $spread_enabled_global retina matches 1 if score $spread_enabled_local retina matches 1 run function random:uniform
execute if score $spread_enabled_global retina matches 1 if score $spread_enabled_local retina matches 1 run scoreboard players operation $random_offset_v retina = $out random

scoreboard players operation $center_comp_h retina = $horizontal_count retina
scoreboard players operation $center_comp_h retina *= $5 retina
scoreboard players remove $center_comp_h retina 5
scoreboard players operation $horizontal_index_offset retina = $horizontal_index retina
scoreboard players operation $horizontal_index_offset retina *= $10 retina
scoreboard players operation $horizontal_index_offset retina -= $center_comp_h retina
scoreboard players operation $horizontal_index_offset retina *= $offset retina
scoreboard players operation $horizontal_index_offset retina *= $random_offset_h retina
scoreboard players operation $horizontal_index_offset retina /= $10 retina

scoreboard players operation $center_comp_v retina = $vertical_count retina
scoreboard players operation $center_comp_v retina *= $5 retina
scoreboard players remove $center_comp_v retina 5
scoreboard players operation $vertical_index_offset retina = $vertical_index retina
scoreboard players operation $vertical_index_offset retina *= $10 retina
scoreboard players operation $vertical_index_offset retina -= $center_comp_v retina
scoreboard players operation $vertical_index_offset retina *= $offset retina
scoreboard players operation $vertical_index_offset retina *= $random_offset_v retina
scoreboard players operation $vertical_index_offset retina /= $10 retina

execute store result score $horizontal_temp_rotation retina run data get entity @e[type=marker,tag=retina.rotate,limit=1] Rotation[0] 10
scoreboard players operation $horizontal_temp_rotation retina += $horizontal_index_offset retina
execute store result entity @e[type=marker,tag=retina.rotate,limit=1] Rotation[0] float 0.1 run scoreboard players get $horizontal_temp_rotation retina

execute store result score $vertical_temp_rotation retina run data get entity @e[type=marker,tag=retina.rotate,limit=1] Rotation[1] 10
scoreboard players operation $vertical_temp_rotation retina += $vertical_index_offset retina
execute store result entity @e[type=marker,tag=retina.rotate,limit=1] Rotation[1] float 0.1 run scoreboard players get $vertical_temp_rotation retina


tag @e[type=marker] remove retina.rotate
scoreboard players add $horizontal_index retina 1
execute if score $horizontal_index retina >= $horizontal_count retina run scoreboard players add $vertical_index retina 1
execute if score $horizontal_index retina >= $horizontal_count retina run scoreboard players set $horizontal_index retina 0
execute if score $horizontal_index retina < $horizontal_count retina if score $vertical_index retina < $vertical_count retina run function retina:raycast/multicast/loop


execute if score $horizontal_index retina >= $horizontal_count retina if score $vertical_index retina >= $vertical_count retina if score $center_count retina matches 1.. run scoreboard players set $center_index retina 0
execute if score $horizontal_index retina >= $horizontal_count retina if score $vertical_index retina >= $vertical_count retina if score $center_count retina matches 1.. run function retina:raycast/multicast/center
