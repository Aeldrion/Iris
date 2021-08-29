#> iris:find_next_block/main
#
# Calculates the position of the ray when it hits the next block
#
# @within iris:raycast/loop
# @output
#	score $[x] iris
#		The integer x coordinate of the next position
#	score $[y] iris
#		The integer y coordinate of the next position
#	score $[z] iris
#		The integer z coordinate of the next position
#	score ${x} iris
#		The fractional x coordinate of the next position, represented by an integer between 0 and 1000000
#	score ${y} iris
#		The fractional y coordinate of the next position, represented by an integer between 0 and 1000000
#	score ${z} iris
#		The fractional z coordinate of the next position, represented by an integer between 0 and 1000000
#	score $previous_[x] iris
#		The integer x coordinate of the position before it is updated by this function
#	score $previous_[y] iris
#		The integer y coordinate of the position before it is updated by this function
#	score $previous_[z] iris
#		The integer z coordinate of the position before it is updated by this function

#> Find whether the next block is adjacent on the X axis, on the Y axis or on the Z axis

# See what distance the ray needs to travel to hit the next block on the X axis
execute if score $dx iris matches 0.. run scoreboard players set $distance_to_next_block_on_x_axis iris 1000000000
execute if score $dx iris matches ..-1 run scoreboard players set $distance_to_next_block_on_x_axis iris 0
scoreboard players operation ${x}*1000 iris = ${x} iris
scoreboard players operation ${x}*1000 iris *= $1000 iris
scoreboard players operation $distance_to_next_block_on_x_axis iris -= ${x}*1000 iris
scoreboard players operation $distance_to_next_block_on_x_axis iris /= $dx iris

# See what distance the ray needs to travel to hit the next block on the Y axis
execute if score $dy iris matches 0.. run scoreboard players set $distance_to_next_block_on_y_axis iris 1000000000
execute if score $dy iris matches ..-1 run scoreboard players set $distance_to_next_block_on_y_axis iris 0
scoreboard players operation ${y}*1000 iris = ${y} iris
scoreboard players operation ${y}*1000 iris *= $1000 iris
scoreboard players operation $distance_to_next_block_on_y_axis iris -= ${y}*1000 iris
scoreboard players operation $distance_to_next_block_on_y_axis iris /= $dy iris

# See what distance the ray needs to travel to hit the next block on the Z axis
execute if score $dz iris matches 0.. run scoreboard players set $distance_to_next_block_on_z_axis iris 1000000000
execute if score $dz iris matches ..-1 run scoreboard players set $distance_to_next_block_on_z_axis iris 0
scoreboard players operation ${z}*1000 iris = ${z} iris
scoreboard players operation ${z}*1000 iris *= $1000 iris
scoreboard players operation $distance_to_next_block_on_z_axis iris -= ${z}*1000 iris
scoreboard players operation $distance_to_next_block_on_z_axis iris /= $dz iris

# Determine which distance is the shortest
execute if score $distance_to_next_block_on_x_axis iris <= $distance_to_next_block_on_y_axis iris if score $distance_to_next_block_on_x_axis iris <= $distance_to_next_block_on_z_axis iris run data merge storage iris:data {ShortestDistanceAxis: "x"}
execute if score $distance_to_next_block_on_y_axis iris <= $distance_to_next_block_on_x_axis iris if score $distance_to_next_block_on_y_axis iris <= $distance_to_next_block_on_z_axis iris run data merge storage iris:data {ShortestDistanceAxis: "y"}
execute if score $distance_to_next_block_on_z_axis iris <= $distance_to_next_block_on_x_axis iris if score $distance_to_next_block_on_z_axis iris <= $distance_to_next_block_on_y_axis iris run data merge storage iris:data {ShortestDistanceAxis: "z"}

#> Update position to the next block

# Save previous coordinates
scoreboard players operation $previous_[x] iris = $[x] iris
scoreboard players operation $previous_[y] iris = $[y] iris
scoreboard players operation $previous_[z] iris = $[z] iris

# Depending on where the ray exits the current block, find the next block and the position of the ray when it exits the current block
execute if data storage iris:data {ShortestDistanceAxis: "x"} run function iris:find_next_block/x
execute if data storage iris:data {ShortestDistanceAxis: "y"} run function iris:find_next_block/y
execute if data storage iris:data {ShortestDistanceAxis: "z"} run function iris:find_next_block/z

# Add distance to total distance
scoreboard players operation $distance_to_next_block iris *= $1000 iris
scoreboard players operation $total_distance iris += $distance_to_next_block iris
scoreboard players operation $distance_to_next_block iris /= $1000 iris