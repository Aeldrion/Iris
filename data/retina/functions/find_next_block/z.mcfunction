#> retina:find_next_block/z
#
# Calculates the position of the ray when it hits the next block, assuming that the next block is north or south of the current block
#
# @within retina:find_next_block/main

# Set the distance to the next block on the z axis as the distance to the next block
scoreboard players operation $distance_to_next_block retina = $distance_to_next_block_on_z_axis retina

# Move z position at the border of the block
execute if score $dz retina matches 0.. run scoreboard players add $[z] retina 1
execute if score $dz retina matches 0.. run scoreboard players set ${z} retina 0
execute if score $dz retina matches ..-1 run scoreboard players remove $[z] retina 1
execute if score $dz retina matches ..-1 run scoreboard players set ${z} retina 1000000

# Calculate new x position
scoreboard players operation $Dx retina = $distance_to_next_block retina
scoreboard players operation $Dx retina *= $dx retina
scoreboard players operation $Dx retina /= $1000 retina
scoreboard players operation ${x} retina += $Dx retina
scoreboard players reset $Dx retina

# Calculate new y position
scoreboard players operation $Dy retina = $distance_to_next_block retina
scoreboard players operation $Dy retina *= $dy retina
scoreboard players operation $Dy retina /= $1000 retina
scoreboard players operation ${y} retina += $Dy retina
scoreboard players reset $Dy retina