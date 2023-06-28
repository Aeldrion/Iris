scoreboard players set $block_found iris 1

# Walls
execute if block ~ ~ ~ #minecraft:walls run function iris:get_hitbox/block/walls

# Wall signs
execute if block ~ ~ ~ #minecraft:wall_signs run function iris:get_hitbox/block/wall_signs

# Wall torches, redstone torches, soul torches
execute if block ~ ~ ~ #iris:wall_torches run function iris:get_hitbox/block/wall_torches