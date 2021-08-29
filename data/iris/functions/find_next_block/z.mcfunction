#> iris:find_next_block/z
#
# Calculates the position of the ray when it hits the next block, assuming that the next block is north or south of the current block
#
# @within iris:find_next_block/main

# Set the distance to the next block on the z axis as the distance to the next block
scoreboard players operation $distance_to_next_block iris = $distance_to_next_block_on_z_axis iris

# Move z position at the border of the block
execute if score $dz iris matches 0.. run scoreboard players add $[z] iris 1
execute if score $dz iris matches 0.. run scoreboard players set ${z} iris 0
execute if score $dz iris matches ..-1 run scoreboard players remove $[z] iris 1
execute if score $dz iris matches ..-1 run scoreboard players set ${z} iris 1000000

# Calculate new x position
scoreboard players operation $Dx iris = $distance_to_next_block iris
scoreboard players operation $Dx iris *= $dx iris
scoreboard players operation $Dx iris /= $1000 iris
scoreboard players operation ${x} iris += $Dx iris
scoreboard players reset $Dx iris

# Calculate new y position
scoreboard players operation $Dy iris = $distance_to_next_block iris
scoreboard players operation $Dy iris *= $dy iris
scoreboard players operation $Dy iris /= $1000 iris
scoreboard players operation ${y} iris += $Dy iris
scoreboard players reset $Dy iris