#> iris:get_side_of_intersection/main
#
# Calculates by which side of the block the ray will exit and how much more the ray needs to progress before reaching another block.
#
# @within iris:raycast/loop
# @output
#	score $distance_to_next_block iris
#		A number between 0 and 1732. The distance in millimetres between the current position and the next block.
#	storage iris:data
#		ShortestDistanceAxis: string
#			The ooordinate that differs between the current block and the next block that the ray will hit.

# Get distance to next block for each axis
function iris:get_side_of_intersection/x
function iris:get_side_of_intersection/y
function iris:get_side_of_intersection/z

# Find axis of shortest distance - e.g. if this axis is x, the ray would first hit a block on its west or east face
execute if score $distance_to_next_block_on_x_axis iris <= $distance_to_next_block_on_y_axis iris if score $distance_to_next_block_on_x_axis iris <= $distance_to_next_block_on_z_axis iris run data merge storage iris:data {ShortestDistanceAxis: "x"}
execute if score $distance_to_next_block_on_y_axis iris <= $distance_to_next_block_on_x_axis iris if score $distance_to_next_block_on_y_axis iris <= $distance_to_next_block_on_z_axis iris run data merge storage iris:data {ShortestDistanceAxis: "y"}
execute if score $distance_to_next_block_on_z_axis iris <= $distance_to_next_block_on_x_axis iris if score $distance_to_next_block_on_z_axis iris <= $distance_to_next_block_on_y_axis iris run data merge storage iris:data {ShortestDistanceAxis: "z"}

# Get the corresponding distance
execute if data storage iris:data {ShortestDistanceAxis: "x"} run scoreboard players operation $distance_to_next_block iris = $distance_to_next_block_on_x_axis iris
execute if data storage iris:data {ShortestDistanceAxis: "y"} run scoreboard players operation $distance_to_next_block iris = $distance_to_next_block_on_y_axis iris
execute if data storage iris:data {ShortestDistanceAxis: "z"} run scoreboard players operation $distance_to_next_block iris = $distance_to_next_block_on_z_axis iris