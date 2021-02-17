# Calculates the distance the ray needs to travel before it hits the next block on the y axis

execute if score $dy iris matches 0.. run scoreboard players set $distance_to_next_block_on_y_axis iris 1000000000
execute if score $dy iris matches ..-1 run scoreboard players set $distance_to_next_block_on_y_axis iris 0

scoreboard players operation ${y}*1000 iris = ${y} iris
scoreboard players operation ${y}*1000 iris *= $1000 iris
scoreboard players operation $distance_to_next_block_on_y_axis iris -= ${y}*1000 iris
scoreboard players operation $distance_to_next_block_on_y_axis iris /= $dy iris

scoreboard players reset ${y}*1000 iris