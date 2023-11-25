# Pufferfish
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_pufferfish iris if entity @s[type=minecraft:pufferfish]
execute if score $entity.is_pufferfish iris matches 1 run function iris:get_hitbox/entity/pufferfish

# Players and blazes
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_player_like iris if entity @s[type=#iris:player_like, predicate=!iris:swimming, predicate=!iris:sneaking]
execute if score $entity.is_player_like iris matches 1 run function iris:get_hitbox/entity/player_like

# Polar bears
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_polar_bear iris if entity @s[type=minecraft:polar_bear]
execute if score $entity.is_polar_bear iris matches 1 run function iris:get_hitbox/entity/polar_bear

# Rabbits
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_rabbit iris if entity @s[type=minecraft:rabbit]
execute if score $entity.is_rabbit iris matches 1 run function iris:get_hitbox/entity/rabbit

# Ravagers
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_ravager iris if entity @s[type=minecraft:ravager]
execute if score $entity.is_ravager iris matches 1 run function iris:get_hitbox/entity/ravager

# Salmons
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_salmon iris if entity @s[type=minecraft:salmon]
execute if score $entity.is_salmon iris matches 1 run function iris:get_hitbox/entity/salmon

# Sheep and goats
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_sheep_like iris if entity @s[type=#iris:sheep_like]
execute if score $entity.is_sheep_like iris matches 1 run function iris:get_hitbox/entity/sheep_like

# Shulkers
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_shulker iris if entity @s[type=minecraft:shulker]
execute if score $entity.is_shulker iris matches 1 run function iris:get_hitbox/entity/shulker

# Skeletons and strays
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_skeleton iris if entity @s[type=#minecraft:skeletons]
execute if score $entity.is_skeleton iris matches 1 run function iris:get_hitbox/entity/skeleton

# Slimes and magma cubes
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_slime_like iris if entity @s[type=#iris:slime_like]
execute if score $entity.is_slime_like iris matches 1 run function iris:get_hitbox/entity/slime_like
