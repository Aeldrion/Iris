scoreboard players set $entity_found iris 1

execute if entity @s[type=minecraft:allay] run return run function iris:get_hitbox/entity/shape_groups/allay
execute if entity @s[type=minecraft:camel] run return run function iris:get_hitbox/entity/shape_groups/camel
execute if entity @s[type=minecraft:frog] run return run function iris:get_hitbox/entity/shape_groups/frog
execute if entity @s[type=minecraft:interaction] run return run function iris:get_hitbox/entity/shape_groups/interaction
execute if entity @s[type=minecraft:sniffer] run return run function iris:get_hitbox/entity/shape_groups/sniffer
execute if entity @s[type=minecraft:warden] run return run function iris:get_hitbox/entity/shape_groups/warden
