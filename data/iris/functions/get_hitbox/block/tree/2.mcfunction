scoreboard players set $block_found iris 1

# Fences
execute if block ~ ~ ~ #minecraft:fences run function iris:get_hitbox/block/fences

# Fence gates
execute if block ~ ~ ~ #minecraft:fence_gates run function iris:get_hitbox/block/fence_gates

# Grass, dead bushes, ferns
execute if block ~ ~ ~ #iris:grass_shaped run function iris:get_hitbox/block/grass

# Iron bars, glass panes
execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes run function iris:get_hitbox/block/iron_bars

# Ladders
execute if block ~ ~ ~ minecraft:ladder run function iris:get_hitbox/block/ladders

# Lanterns, soul lanterns
execute if block ~ ~ ~ #iris:lanterns run function iris:get_hitbox/block/lanterns

# Brown mushrooms, red mushrooms, flower pots, potted plants
execute if block ~ ~ ~ #iris:mushroom_shaped run function iris:get_hitbox/block/mushrooms

# Pressure plates
execute if block ~ ~ ~ #minecraft:pressure_plates run function iris:get_hitbox/block/pressure_plates
