# Guardians
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_guardian iris if entity @s[type=minecraft:guardian]
execute if score $entity.is_guardian iris matches 1 run function iris:get_hitbox/entity/guardian

# Hoglins and zoglins
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_hoglin iris if entity @s[type=#iris:hoglins]
execute if score $entity.is_hoglin iris matches 1 run function iris:get_hitbox/entity/hoglin

# Horses and mules
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_horse iris if entity @s[type=#iris:horses]
execute if score $entity.is_horse iris matches 1 run function iris:get_hitbox/entity/horse

# Iron golems
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_iron_golem iris if entity @s[type=minecraft:iron_golem]
execute if score $entity.is_iron_golem iris matches 1 run function iris:get_hitbox/entity/iron_golem

# Leash knots
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_leash_knot iris if entity @s[type=minecraft:leash_knot]
execute if score $entity.is_leash_knot iris matches 1 run function iris:get_hitbox/entity/leash_knot

# Llamas and trader llamas
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_llama iris if entity @s[type=#iris:llamas]
execute if score $entity.is_llama iris matches 1 run function iris:get_hitbox/entity/llama

# Minecarts (with chests, with command blocks, with furnaces, with hoppers, with spawners, with TNT)
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_minecart iris if entity @s[type=#iris:minecarts]
execute if score $entity.is_minecart iris matches 1 run function iris:get_hitbox/entity/minecart

# Pandas
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_panda iris if entity @s[type=minecraft:panda]
execute if score $entity.is_panda iris matches 1 run function iris:get_hitbox/entity/panda

# Phantoms
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_phantom iris if entity @s[type=minecraft:phantom]
execute if score $entity.is_phantom iris matches 1 run function iris:get_hitbox/entity/phantom

# Pigs
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_pig iris if entity @s[type=minecraft:pig]
execute if score $entity.is_pig iris matches 1 run function iris:get_hitbox/entity/pig
