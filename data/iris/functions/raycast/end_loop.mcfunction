#> iris:raycast/end_loop
#
# Runs when the ray hits a solid surface and outputs every available information to storage
#
# @within iris:raycast/on_block_found

# Contact surface
data modify storage iris:output ContactSurface set from storage iris:data ContactSurface

# Contact coordinates
data modify storage iris:output ContactCoordinates set value [0.0d, 0.0d, 0.0d]
execute store result storage iris:output ContactCoordinates[0] double 0.000001 run scoreboard players get $targeted_x iris
execute store result storage iris:output ContactCoordinates[1] double 0.000001 run scoreboard players get $targeted_y iris
execute store result storage iris:output ContactCoordinates[2] double 0.000001 run scoreboard players get $targeted_z iris

# Targeted block
data modify storage iris:output TargetedBlock set value [0, 0, 0]
execute store result storage iris:output TargetedBlock[0] int 1 run scoreboard players get $[x] iris
execute store result storage iris:output TargetedBlock[1] int 1 run scoreboard players get $[y] iris
execute store result storage iris:output TargetedBlock[2] int 1 run scoreboard players get $[z] iris

# Placing position
data modify storage iris:output PlacingPosition set value [0, 0, 0]
execute store result storage iris:output PlacingPosition[0] int 1 run scoreboard players get $previous_[x] iris
execute store result storage iris:output PlacingPosition[1] int 1 run scoreboard players get $previous_[y] iris
execute store result storage iris:output PlacingPosition[2] int 1 run scoreboard players get $previous_[z] iris

# Total distance
scoreboard players operation $total_distance iris += $min_distance_to_surface iris
execute store result storage iris:output Distance double 0.000001 run scoreboard players get $total_distance iris

# Exit loop
scoreboard players operation $depth iris = $max_depth iris