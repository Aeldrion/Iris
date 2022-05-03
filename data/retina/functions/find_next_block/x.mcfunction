#> retina:find_next_block/x
#
# Calculates the position of the ray when it hits the next block, assuming that the next block is west or east of the current block
#
# @within retina:find_next_block/main

# Set the distance to the next block on the x axis as the distance to the next block
scoreboard players operation $distance_to_next_block retina = $distance_to_next_block_on_x_axis retina

# Move x position at the border of the block
execute if score $dx retina matches 0.. run scoreboard players add $[x] retina 1
execute if score $dx retina matches 0.. run scoreboard players set ${x} retina 0
execute if score $dx retina matches ..-1 run scoreboard players remove $[x] retina 1
execute if score $dx retina matches ..-1 run scoreboard players set ${x} retina 1000000

# Calculate new y position
scoreboard players operation $Dy retina = $distance_to_next_block retina
scoreboard players operation $Dy retina *= $dy retina
scoreboard players operation $Dy retina /= $1000 retina
scoreboard players operation ${y} retina += $Dy retina
scoreboard players reset $Dy retina

# Calculate new z position
scoreboard players operation $Dz retina = $distance_to_next_block retina
scoreboard players operation $Dz retina *= $dz retina
scoreboard players operation $Dz retina /= $1000 retina
scoreboard players operation ${z} retina += $Dz retina
scoreboard players reset $Dz retina