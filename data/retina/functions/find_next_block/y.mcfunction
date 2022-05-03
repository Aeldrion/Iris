#> retina:find_next_block/y
#
# Calculates the position of the ray when it hits the next block, assuming that the next block is above or below the current block
#
# @within retina:find_next_block/main

# Set the distance to the next block on the y axis as the distance to the next block
scoreboard players operation $distance_to_next_block retina = $distance_to_next_block_on_y_axis retina

# Move y position at the border of the block
execute if score $dy retina matches 0.. run scoreboard players add $[y] retina 1
execute if score $dy retina matches 0.. run scoreboard players set ${y} retina 0
execute if score $dy retina matches ..-1 run scoreboard players remove $[y] retina 1
execute if score $dy retina matches ..-1 run scoreboard players set ${y} retina 1000000

# Calculate new x position
scoreboard players operation $Dx retina = $distance_to_next_block retina
scoreboard players operation $Dx retina *= $dx retina
scoreboard players operation $Dx retina /= $1000 retina
scoreboard players operation ${x} retina += $Dx retina
scoreboard players reset $Dx retina

# Calculate new z position
scoreboard players operation $Dz retina = $distance_to_next_block retina
scoreboard players operation $Dz retina *= $dz retina
scoreboard players operation $Dz retina /= $1000 retina
scoreboard players operation ${z} retina += $Dz retina
scoreboard players reset $Dz retina