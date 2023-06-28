scoreboard players set $block_found iris 1

# Carpets
execute if block ~ ~ ~ #minecraft:wool_carpets run function iris:get_hitbox/block/carpets

# Cauldrons
execute if block ~ ~ ~ #minecraft:cauldrons run function iris:get_hitbox/block/cauldrons

# Chains
execute if block ~ ~ ~ minecraft:chain run function iris:get_hitbox/block/chain

# Chests, trapped chests
execute if block ~ ~ ~ #iris:chests run function iris:get_hitbox/block/chest

# Composters
execute if block ~ ~ ~ minecraft:composter run function iris:get_hitbox/block/composter

# Conduits
execute if block ~ ~ ~ minecraft:conduit run function iris:get_hitbox/block/conduit

# Doors
execute if block ~ ~ ~ #minecraft:doors run function iris:get_hitbox/block/doors

# Farmland, dirt paths
execute if block ~ ~ ~ #iris:farmland_shaped run function iris:get_hitbox/block/farmland
