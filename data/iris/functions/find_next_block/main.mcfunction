# Save coordinates
scoreboard players operation $previous_[x] iris = $[x] iris
scoreboard players operation $previous_[y] iris = $[y] iris
scoreboard players operation $previous_[z] iris = $[z] iris

# Depending on where the ray exits the current block, find the next block and the position of the ray when it exits the current block
execute if data storage iris:data {ShortestDistanceAxis: "x"} run function iris:find_next_block/x
execute if data storage iris:data {ShortestDistanceAxis: "y"} run function iris:find_next_block/y
execute if data storage iris:data {ShortestDistanceAxis: "z"} run function iris:find_next_block/z