# Calculates by which side of the block the ray will exit

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