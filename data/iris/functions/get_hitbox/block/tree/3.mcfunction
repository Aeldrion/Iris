scoreboard players set $block_found iris 1

# Saplings
execute if block ~ ~ ~ #minecraft:saplings run function iris:get_hitbox/block/saplings

# Stairs
execute if block ~ ~ ~ #minecraft:stairs run function iris:get_hitbox/block/stairs

# Slabs
execute if block ~ ~ ~ #minecraft:slabs run function iris:get_hitbox/block/slabs

# Activator rails, detector rails, powered rails
execute if block ~ ~ ~ #iris:special_rails run function iris:get_hitbox/block/special_rails

# Standing signs, banners
execute if block ~ ~ ~ #iris:standing_signs_and_banners run function iris:get_hitbox/block/standing_signs_and_banners

# Sugar cane, tall seagrass
execute if block ~ ~ ~ #iris:sugar_cane_like run function iris:get_hitbox/block/sugar_cane

# Torches, redstone torches, soul torches placed on the ground
execute if block ~ ~ ~ #iris:torches run function iris:get_hitbox/block/torches

# Trapdoors
execute if block ~ ~ ~ #minecraft:trapdoors run function iris:get_hitbox/block/trapdoors
