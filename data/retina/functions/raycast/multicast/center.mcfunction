tag @s add retina.reference_player
execute positioned ^ ^ ^ anchored eyes run summon marker ^ ^ ^ {Tags:["retina.multicast","retina.rotate"]}
#execute as @e[type=marker,limit=1,tag=retina.rotate] run tp @s ^ ^ ^ facing entity @a[tag=retina.reference_player,sort=nearest,limit=1]
execute as @e[type=marker,limit=1,tag=retina.rotate] store result entity @s Rotation[0] float 0.01 run data get entity @a[tag=retina.reference_player,sort=nearest,limit=1] Rotation[0] 100
execute as @e[type=marker,limit=1,tag=retina.rotate] store result entity @s Rotation[1] float 0.01 run data get entity @a[tag=retina.reference_player,sort=nearest,limit=1] Rotation[1] 100


scoreboard players operation $center_comp_h retina = $horizontal_count retina
scoreboard players operation $center_comp_h retina *= $5 retina
scoreboard players remove $center_comp_h retina 5
scoreboard players operation $center_comp_h retina *= $offset retina

scoreboard players operation $center_comp_v retina = $vertical_count retina
scoreboard players operation $center_comp_v retina *= $5 retina
scoreboard players remove $center_comp_v retina 5
scoreboard players operation $center_comp_v retina *= $offset retina

execute store result score $horizontal_temp_rotation retina run data get entity @e[type=marker,tag=retina.rotate,limit=1] Rotation[0] 10
scoreboard players operation $horizontal_temp_rotation retina -= $center_comp_h retina
execute store result entity @e[type=marker,tag=retina.rotate,limit=1] Rotation[0] float 0.1 run scoreboard players get $horizontal_temp_rotation retina

execute store result score $vertical_temp_rotation retina run data get entity @e[type=marker,tag=retina.rotate,limit=1] Rotation[1] 10
scoreboard players operation $vertical_temp_rotation retina -= $center_comp_v retina
execute store result entity @e[type=marker,tag=retina.rotate,limit=1] Rotation[1] float 0.1 run scoreboard players get $vertical_temp_rotation retina

tag @e[type=marker] remove retina.rotate
scoreboard players add $center_index retina 1
execute if score $center_index retina < $center_count retina run function retina:raycast/multicast/center