# Snow golems
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_snow_golem iris if entity @s[type=minecraft:snow_golem]
execute if score $entity.is_snow_golem iris matches 1 run function iris:get_hitbox/entity/snow_golem

# Striders
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_strider iris if entity @s[type=minecraft:strider]
execute if score $entity.is_strider iris matches 1 run function iris:get_hitbox/entity/strider

# Squids and glow squids
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_squid iris if entity @s[type=#iris:squids]
execute if score $entity.is_squid iris matches 1 run function iris:get_hitbox/entity/squid

# Spiders
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_spider iris if entity @s[type=minecraft:spider]
execute if score $entity.is_spider iris matches 1 run function iris:get_hitbox/entity/spider

# Tropical fish
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_tropical_fish iris if entity @s[type=minecraft:tropical_fish]
execute if score $entity.is_tropical_fish iris matches 1 run function iris:get_hitbox/entity/tropical_fish

# Turtles
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_turtle iris if entity @s[type=minecraft:turtle]
execute if score $entity.is_turtle iris matches 1 run function iris:get_hitbox/entity/turtle

# Vexes
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_vex iris if entity @s[type=minecraft:vex]
execute if score $entity.is_vex iris matches 1 run function iris:get_hitbox/entity/vex

# Withers
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_wither iris if entity @s[type=minecraft:wither]
execute if score $entity.is_wither iris matches 1 run function iris:get_hitbox/entity/wither

# Wither skeletons
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_wither_skeleton iris if entity @s[type=minecraft:wither_skeleton]
execute if score $entity.is_wither_skeleton iris matches 1 run function iris:get_hitbox/entity/wither_skeleton

# Wolves
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_wolf iris if entity @s[type=minecraft:wolf]
execute if score $entity.is_wolf iris matches 1 run function iris:get_hitbox/entity/wolf

# Drowned, evoker, husk, illusioner, piglin, piglin_brute, pillager, villager, vindicator, wandering trader, witch, zombie, zombie villager, zombified piglin
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_zombie_like iris if entity @s[type=#iris:zombie_like, predicate=!iris:swimming]
execute if score $entity.is_zombie_like iris matches 1 run function iris:get_hitbox/entity/zombie_like
