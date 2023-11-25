# Armour stands
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_armor_stand iris if entity @s[type=minecraft:armor_stand]
execute if score $entity.is_armor_stand iris matches 1 run function iris:get_hitbox/entity/armor_stand

# Axolotls
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_axolotl iris if entity @s[type=minecraft:axolotl]
execute if score $entity.is_axolotl iris matches 1 run function iris:get_hitbox/entity/axolotl

# Bats, parrots
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_bat_like iris if entity @s[type=#iris:bat_like]
execute if score $entity.is_bat_like iris matches 1 run function iris:get_hitbox/entity/bat_like

# Bees
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_bee iris if entity @s[type=minecraft:bee]
execute if score $entity.is_bee iris matches 1 run function iris:get_hitbox/entity/bee

# Boats
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_boat iris if entity @s[type=minecraft:boat]
execute if score $entity.is_boat iris matches 1 run function iris:get_hitbox/entity/boat

# Cats, foxes, ocelots
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_cat_like iris if entity @s[type=#iris:cat_like]
execute if score $entity.is_cat_like iris matches 1 run function iris:get_hitbox/entity/cat_like

# Cave spiders
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_cave_spider iris if entity @s[type=minecraft:cave_spider]
execute if score $entity.is_cave_spider iris matches 1 run function iris:get_hitbox/entity/cave_spider

# Chickens
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_chicken iris if entity @s[type=minecraft:chicken]
execute if score $entity.is_chicken iris matches 1 run function iris:get_hitbox/entity/chicken

# Cods
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_cod iris if entity @s[type=minecraft:cod]
execute if score $entity.is_cod iris matches 1 run function iris:get_hitbox/entity/cod

# Cows and mooshrooms
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_cow iris if entity @s[type=#iris:cows]
execute if score $entity.is_cow iris matches 1 run function iris:get_hitbox/entity/cow
