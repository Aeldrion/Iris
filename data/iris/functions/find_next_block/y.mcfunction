#> iris:find_next_block/y
#
# Calculates the position of the ray when it hits the next block, assuming that the next block is above or below the current block
#
# @within iris:find_next_block/main

# Set the distance to the next block on the y axis as the distance to the next block
scoreboard players operation $distance_to_next_block iris = $distance_to_next_block_on_y_axis iris

# Move y position at the border of the block
execute if score $dy iris matches 0.. run scoreboard players add $[y] iris 1
execute if score $dy iris matches 0.. run scoreboard players set ${y} iris 0
execute if score $dy iris matches ..-1 run scoreboard players remove $[y] iris 1
execute if score $dy iris matches ..-1 run scoreboard players set ${y} iris 1000000

# Calculate new x position
scoreboard players operation $Dx iris = $distance_to_next_block iris
scoreboard players operation $Dx iris *= $dx iris
scoreboard players operation $Dx iris /= $1000 iris
scoreboard players operation ${x} iris += $Dx iris
scoreboard players reset $Dx iris

# Calculate new z position
scoreboard players operation $Dz iris = $distance_to_next_block iris
scoreboard players operation $Dz iris *= $dz iris
scoreboard players operation $Dz iris /= $1000 iris
scoreboard players operation ${z} iris += $Dz iris
scoreboard players reset $Dz iris