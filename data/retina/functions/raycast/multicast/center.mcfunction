tag @s add retina.reference_player
execute positioned ^ ^ ^ anchored eyes run summon marker ^ ^ ^ {Tags:["retina.multicast","retina.rotate"]}
#execute as @e[type=marker,limit=1,tag=retina.rotate] run tp @s ^ ^ ^ facing entity @a[tag=retina.reference_player,sort=nearest,limit=1]
execute as @e[type=marker,limit=1,tag=retina.rotate] store result entity @s Rotation[0] float 0.01 run data get entity @a[tag=retina.reference_player,sort=nearest,limit=1] Rotation[0] 100
execute as @e[type=marker,limit=1,tag=retina.rotate] store result entity @s Rotation[1] float 0.01 run data get entity @a[tag=retina.reference_player,sort=nearest,limit=1] Rotation[1] 100
execute as @e[type=marker,tag=retina.multicast] run scoreboard players operation @s retina.show_particle = @p[tag=retina.reference_player] retina.show_particle
execute as @e[type=marker,tag=retina.multicast] run scoreboard players operation @s retina.show_line = @p[tag=retina.reference_player] retina.show_line


tag @e[type=marker] remove retina.rotate
scoreboard players add $center_index retina 1
execute if score $center_index retina < $center_count retina run function retina:raycast/multicast/center