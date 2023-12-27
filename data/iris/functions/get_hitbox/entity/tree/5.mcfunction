scoreboard players set $entity_found iris 1

execute if entity @s[type=minecraft:allay] run return run function iris:get_hitbox/entity/allay
execute if entity @s[type=minecraft:camel] run return run function iris:get_hitbox/entity/camel
execute if entity @s[type=minecraft:frog] run return run function iris:get_hitbox/entity/frog
execute if entity @s[type=minecraft:interaction] run return run function iris:get_hitbox/entity/interaction
execute if entity @s[type=minecraft:sniffer] run return run function iris:get_hitbox/entity/sniffer
execute if entity @s[type=minecraft:warden] run return run function iris:get_hitbox/entity/warden
execute if entity @s[type=#iris:armadillo] run return run function iris:get_hitbox/entity/armadillo