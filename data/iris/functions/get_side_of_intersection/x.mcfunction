# Calculates the distance the ray needs to travel before it hits the next block on the x axis

execute if score $dx iris matches 0.. run scoreboard players set $distance_to_next_block_on_x_axis iris 1000000000
execute if score $dx iris matches ..-1 run scoreboard players set $distance_to_next_block_on_x_axis iris 0

scoreboard players operation ${x}*1000 iris = ${x} iris
scoreboard players operation ${x}*1000 iris *= $1000 iris
scoreboard players operation $distance_to_next_block_on_x_axis iris -= ${x}*1000 iris
scoreboard players operation $distance_to_next_block_on_x_axis iris /= $dx iris

scoreboard players reset ${x}*1000 iris