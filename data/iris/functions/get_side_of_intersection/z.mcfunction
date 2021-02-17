# Calculates the distance the ray needs to travel before it hits the next block on the z axis

execute if score $dz iris matches 0.. run scoreboard players set $distance_to_next_block_on_z_axis iris 1000000000
execute if score $dz iris matches ..-1 run scoreboard players set $distance_to_next_block_on_z_axis iris 0

scoreboard players operation ${z}*1000 iris = ${z} iris
scoreboard players operation ${z}*1000 iris *= $1000 iris
scoreboard players operation $distance_to_next_block_on_z_axis iris -= ${z}*1000 iris
scoreboard players operation $distance_to_next_block_on_z_axis iris /= $dz iris

scoreboard players reset ${z}*1000 iris