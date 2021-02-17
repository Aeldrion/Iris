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