#> iris:raycast/find_next_block
#
# Find the coordinates of the next tile that should be traversed by the ray
#
# @private
# @within iris:raycast/loop
# @writes
#   scores $[x] $[y] $[z] iris
#       The new position
#   scores $last_[x] $last_[y] $last_[z] iris
#       The previous position
# @output
#   Result: The distance to the next block
#   Success: 1

# Save previous coordinates
scoreboard players operation $last_[x] iris = $[x] iris
scoreboard players operation $last_[y] iris = $[y] iris
scoreboard players operation $last_[z] iris = $[z] iris

# See what distance the ray needs to travel to hit another tile with a different x coordinate
execute if score $dx iris matches 0.. run scoreboard players set $to_next_x iris 1000000000
execute if score $dx iris matches ..-1 run scoreboard players set $to_next_x iris 0
scoreboard players operation ${x}*1000 iris = ${x} iris
scoreboard players operation ${x}*1000 iris *= $1000 iris
scoreboard players operation $to_next_x iris -= ${x}*1000 iris
scoreboard players operation $to_next_x iris /= $dx iris

# See what distance the ray needs to travel to hit another tile with a different y coordinate
execute if score $dy iris matches 0.. run scoreboard players set $to_next_y iris 1000000000
execute if score $dy iris matches ..-1 run scoreboard players set $to_next_y iris 0
scoreboard players operation ${y}*1000 iris = ${y} iris
scoreboard players operation ${y}*1000 iris *= $1000 iris
scoreboard players operation $to_next_y iris -= ${y}*1000 iris
scoreboard players operation $to_next_y iris /= $dy iris

# See what distance the ray needs to travel to hit another tile with a different z coordinate
execute if score $dz iris matches 0.. run scoreboard players set $to_next_z iris 1000000000
execute if score $dz iris matches ..-1 run scoreboard players set $to_next_z iris 0
scoreboard players operation ${z}*1000 iris = ${z} iris
scoreboard players operation ${z}*1000 iris *= $1000 iris
scoreboard players operation $to_next_z iris -= ${z}*1000 iris
scoreboard players operation $to_next_z iris /= $dz iris

# Determine which distance is the shortest
execute if score $to_next_x iris <= $to_next_y iris if score $to_next_x iris <= $to_next_z iris run data merge storage iris:data {NextCoordinateChange: "x"}
execute if score $to_next_y iris <= $to_next_x iris if score $to_next_y iris <= $to_next_z iris run data merge storage iris:data {NextCoordinateChange: "y"}
execute if score $to_next_z iris <= $to_next_x iris if score $to_next_z iris <= $to_next_y iris run data merge storage iris:data {NextCoordinateChange: "z"}

# Calculate the new coordinates when the ray reaches the next tile
execute if data storage iris:data {NextCoordinateChange: "x"} run data modify storage iris:args {} merge value {a: "x", b: "y", c: "z"}
execute if data storage iris:data {NextCoordinateChange: "y"} run data modify storage iris:args {} merge value {a: "y", b: "z", c: "x"}
execute if data storage iris:data {NextCoordinateChange: "z"} run data modify storage iris:args {} merge value {a: "z", b: "x", c: "y"}
function iris:raycast/macro_functions/find_next_block_aux with storage iris:args

# Return the added distance
return run scoreboard players operation $to_next_block iris *= $1000 iris
