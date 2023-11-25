# Creepers
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_creeper iris if entity @s[type=minecraft:creeper]
execute if score $entity.is_creeper iris matches 1 run function iris:get_hitbox/entity/creeper

# Dolphins
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_dolphin iris if entity @s[type=minecraft:dolphin]
execute if score $entity.is_dolphin iris matches 1 run function iris:get_hitbox/entity/dolphin

# Donkeys
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_donkey iris if entity @s[type=minecraft:donkey]
execute if score $entity.is_donkey iris matches 1 run function iris:get_hitbox/entity/donkey

# Elder guardians
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_elder_guardian iris if entity @s[type=minecraft:elder_guardian]
execute if score $entity.is_elder_guardian iris matches 1 run function iris:get_hitbox/entity/elder_guardian

# End crystals
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_end_crystal iris if entity @s[type=minecraft:end_crystal]
execute if score $entity.is_end_crystal iris matches 1 run function iris:get_hitbox/entity/end_crystal

# Endermen
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_enderman iris if entity @s[type=minecraft:enderman]
execute if score $entity.is_enderman iris matches 1 run function iris:get_hitbox/entity/enderman

# Endermites and silverfish
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_endermite_like iris if entity @s[type=#iris:endermite_like]
execute if score $entity.is_endermite_like iris matches 1 run function iris:get_hitbox/entity/endermite_like

# Falling blocks and primed TNT
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_falling_block_like iris if entity @s[type=#iris:falling_block_like]
execute if score $entity.is_falling_block_like iris matches 1 run function iris:get_hitbox/entity/falling_block_like

# Ghasts
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_ghast iris if entity @s[type=minecraft:ghast]
execute if score $entity.is_ghast iris matches 1 run function iris:get_hitbox/entity/ghast

# Giants
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_giant iris if entity @s[type=minecraft:giant]
execute if score $entity.is_giant iris matches 1 run function iris:get_hitbox/entity/giant
