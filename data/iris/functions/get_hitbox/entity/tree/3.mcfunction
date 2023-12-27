scoreboard players set $entity_found iris 1

execute if entity @s[type=minecraft:pufferfish] run return run function iris:get_hitbox/entity/shape_groups/pufferfish
execute if entity @s[type=#iris:player_like] run return run function iris:get_hitbox/entity/shape_groups/player_like
execute if entity @s[type=minecraft:polar_bear] run return run function iris:get_hitbox/entity/shape_groups/polar_bear
execute if entity @s[type=minecraft:rabbit] run return run function iris:get_hitbox/entity/shape_groups/rabbit
execute if entity @s[type=minecraft:ravager] run return run function iris:get_hitbox/entity/shape_groups/ravager
execute if entity @s[type=minecraft:salmon] run return run function iris:get_hitbox/entity/shape_groups/salmon
execute if entity @s[type=#iris:sheep_like] run return run function iris:get_hitbox/entity/shape_groups/sheep
execute if entity @s[type=minecraft:shulker] run return run function iris:get_hitbox/entity/shape_groups/shulker
execute if entity @s[type=#minecraft:skeletons] run return run function iris:get_hitbox/entity/shape_groups/skeleton
execute if entity @s[type=#iris:slime_like] run return run function iris:get_hitbox/entity/shape_groups/magma_cube
