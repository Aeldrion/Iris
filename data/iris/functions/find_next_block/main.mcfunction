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

# Save coordinates
scoreboard players operation $previous_[x] iris = $[x] iris
scoreboard players operation $previous_[y] iris = $[y] iris
scoreboard players operation $previous_[z] iris = $[z] iris

# Depending on where the ray exits the current block, find the next block and the position of the ray when it exits the current block
execute if data storage iris:data {ShortestDistanceAxis: "x"} run function iris:find_next_block/x
execute if data storage iris:data {ShortestDistanceAxis: "y"} run function iris:find_next_block/y
execute if data storage iris:data {ShortestDistanceAxis: "z"} run function iris:find_next_block/z