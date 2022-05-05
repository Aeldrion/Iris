# function retina:display_particle
function retina:display_particle
execute if score #hit retinacasttemp matches 0 positioned ~-0.05 ~-0.05 ~-0.05 as @e[type=#retina_vdv:entities,tag=!retina.vdv,dx=0,sort=nearest] run function retina_vdv:check_hit_entity
scoreboard players add #distance retinacasttemp 1
execute if score #hit retinacasttemp matches 0 if score #distance retinacasttemp matches ..1800 positioned ^ ^ ^0.1 run function retina_vdv:ray
