scoreboard players set $entity_found iris 1

execute if entity @s[type=minecraft:snow_golem] run return run function iris:get_hitbox/entity/shape_groups/snow_golem
execute if entity @s[type=minecraft:strider] run return run function iris:get_hitbox/entity/shape_groups/strider
execute if entity @s[type=#iris:squids] run return run function iris:get_hitbox/entity/shape_groups/squid
execute if entity @s[type=minecraft:spider] run return run function iris:get_hitbox/entity/shape_groups/spider
execute if entity @s[type=minecraft:tropical_fish] run return run function iris:get_hitbox/entity/shape_groups/tropical_fish
execute if entity @s[type=minecraft:turtle] run return run function iris:get_hitbox/entity/shape_groups/turtle
execute if entity @s[type=minecraft:vex] run return run function iris:get_hitbox/entity/shape_groups/vex
execute if entity @s[type=minecraft:wither] run return run function iris:get_hitbox/entity/shape_groups/wither
execute if entity @s[type=minecraft:wither_skeleton] run return run function iris:get_hitbox/entity/shape_groups/wither_skeleton
execute if entity @s[type=minecraft:wolf] run return run function iris:get_hitbox/entity/shape_groups/wolf
execute if entity @s[type=#iris:zombie_like] run return run function iris:get_hitbox/entity/shape_groups/drowned
