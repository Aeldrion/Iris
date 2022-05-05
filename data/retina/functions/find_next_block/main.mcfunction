#> retina:find_next_block/main
#
# Calculates the position of the ray when it hits the next block
#
# @within retina:raycast/loop
# @output
#	score $[x] retina
#		The integer x coordinate of the next position
#	score $[y] retina
#		The integer y coordinate of the next position
#	score $[z] retina
#		The integer z coordinate of the next position
#	score ${x} retina
#		The fractional x coordinate of the next position, represented by an integer between 0 and 1000000
#	score ${y} retina
#		The fractional y coordinate of the next position, represented by an integer between 0 and 1000000
#	score ${z} retina
#		The fractional z coordinate of the next position, represented by an integer between 0 and 1000000
#	score $previous_[x] retina
#		The integer x coordinate of the position before it is updated by this function
#	score $previous_[y] retina
#		The integer y coordinate of the position before it is updated by this function
#	score $previous_[z] retina
#		The integer z coordinate of the position before it is updated by this function

#> Find whether the next block is adjacent on the X axis, on the Y axis or on the Z axis

# See what distance the ray needs to travel to hit the next block on the X axis
execute if score $dx retina matches 0.. run scoreboard players set $distance_to_next_block_on_x_axis retina 1000000000
execute if score $dx retina matches ..-1 run scoreboard players set $distance_to_next_block_on_x_axis retina 0
scoreboard players operation ${x}*1000 retina = ${x} retina
scoreboard players operation ${x}*1000 retina *= $1000 retina
scoreboard players operation $distance_to_next_block_on_x_axis retina -= ${x}*1000 retina
scoreboard players operation $distance_to_next_block_on_x_axis retina /= $dx retina

# See what distance the ray needs to travel to hit the next block on the Y axis
execute if score $dy retina matches 0.. run scoreboard players set $distance_to_next_block_on_y_axis retina 1000000000
execute if score $dy retina matches ..-1 run scoreboard players set $distance_to_next_block_on_y_axis retina 0
scoreboard players operation ${y}*1000 retina = ${y} retina
scoreboard players operation ${y}*1000 retina *= $1000 retina
scoreboard players operation $distance_to_next_block_on_y_axis retina -= ${y}*1000 retina
scoreboard players operation $distance_to_next_block_on_y_axis retina /= $dy retina

# See what distance the ray needs to travel to hit the next block on the Z axis
execute if score $dz retina matches 0.. run scoreboard players set $distance_to_next_block_on_z_axis retina 1000000000
execute if score $dz retina matches ..-1 run scoreboard players set $distance_to_next_block_on_z_axis retina 0
scoreboard players operation ${z}*1000 retina = ${z} retina
scoreboard players operation ${z}*1000 retina *= $1000 retina
scoreboard players operation $distance_to_next_block_on_z_axis retina -= ${z}*1000 retina
scoreboard players operation $distance_to_next_block_on_z_axis retina /= $dz retina

# Determine which distance is the shortest
execute if score $distance_to_next_block_on_x_axis retina <= $distance_to_next_block_on_y_axis retina if score $distance_to_next_block_on_x_axis retina <= $distance_to_next_block_on_z_axis retina run data merge storage retina:data {ShortestDistanceAxis: "x"}
execute if score $distance_to_next_block_on_y_axis retina <= $distance_to_next_block_on_x_axis retina if score $distance_to_next_block_on_y_axis retina <= $distance_to_next_block_on_z_axis retina run data merge storage retina:data {ShortestDistanceAxis: "y"}
execute if score $distance_to_next_block_on_z_axis retina <= $distance_to_next_block_on_x_axis retina if score $distance_to_next_block_on_z_axis retina <= $distance_to_next_block_on_y_axis retina run data merge storage retina:data {ShortestDistanceAxis: "z"}

#> Update position to the next block

# Save previous coordinates
scoreboard players operation $previous_[x] retina = $[x] retina
scoreboard players operation $previous_[y] retina = $[y] retina
scoreboard players operation $previous_[z] retina = $[z] retina

# Depending on where the ray exits the current block, find the next block and the position of the ray when it exits the current block
execute if data storage retina:data {ShortestDistanceAxis: "x"} run function retina:find_next_block/x
execute if data storage retina:data {ShortestDistanceAxis: "y"} run function retina:find_next_block/y
execute if data storage retina:data {ShortestDistanceAxis: "z"} run function retina:find_next_block/z

# Add distance to total distance
scoreboard players operation $distance_to_next_block retina *= $1000 retina
scoreboard players operation $total_distance retina += $distance_to_next_block retina
scoreboard players operation $distance_to_next_block retina /= $1000 retina