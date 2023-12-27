scoreboard players set $entity_found iris 1

execute if entity @s[type=minecraft:guardian] run return run function iris:get_hitbox/entity/shape_groups/guardian
execute if entity @s[type=#iris:hoglins] run return run function iris:get_hitbox/entity/shape_groups/hoglin
execute if entity @s[type=#iris:horses] run return run function iris:get_hitbox/entity/shape_groups/horse
execute if entity @s[type=minecraft:iron_golem] run return run function iris:get_hitbox/entity/shape_groups/iron_golem
execute if entity @s[type=minecraft:leash_knot] run return run function iris:get_hitbox/entity/shape_groups/leash_knot
execute if entity @s[type=#iris:llamas] run return run function iris:get_hitbox/entity/shape_groups/llama
execute if entity @s[type=#iris:minecarts] run return run function iris:get_hitbox/entity/shape_groups/minecart
execute if entity @s[type=minecraft:panda] run return run function iris:get_hitbox/entity/shape_groups/panda
execute if entity @s[type=minecraft:phantom] run return run function iris:get_hitbox/entity/shape_groups/phantom
execute if entity @s[type=minecraft:pig] run return run function iris:get_hitbox/entity/shape_groups/pig
