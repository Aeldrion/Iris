#> iris:find_next_block/x
#
# Calculates the position of the ray when it hits the next block, assuming that the next block is west or east of the current block
#
# @within iris:find_next_block/main

# Set the distance to the next block on the x axis as the distance to the next block
scoreboard players operation $distance_to_next_block iris = $distance_to_next_block_on_x_axis iris

# Move x position at the border of the block
execute if score $dx iris matches 0.. run scoreboard players add $[x] iris 1
execute if score $dx iris matches 0.. run scoreboard players set ${x} iris 0
execute if score $dx iris matches ..-1 run scoreboard players remove $[x] iris 1
execute if score $dx iris matches ..-1 run scoreboard players set ${x} iris 1000000

# Calculate new y position
scoreboard players operation $Dy iris = $distance_to_next_block iris
scoreboard players operation $Dy iris *= $dy iris
scoreboard players operation $Dy iris /= $1000 iris
scoreboard players operation ${y} iris += $Dy iris
scoreboard players reset $Dy iris

# Calculate new z position
scoreboard players operation $Dz iris = $distance_to_next_block iris
scoreboard players operation $Dz iris *= $dz iris
scoreboard players operation $Dz iris /= $1000 iris
scoreboard players operation ${z} iris += $Dz iris
scoreboard players reset $Dz iris