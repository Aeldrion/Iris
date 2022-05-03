#> retina:raycast/hit_block
#
# Runs when the ray hits a solid block surface and outputs all available information to storage
#
# @within retina:raycast/loop

# Target type
data modify storage retina:output Target set value "BLOCK"

# Targeted block
data modify storage retina:output TargetedBlock set value [0, 0, 0]
execute store result storage retina:output TargetedBlock[0] int 1 run scoreboard players get $[x] retina
execute store result storage retina:output TargetedBlock[1] int 1 run scoreboard players get $[y] retina
execute store result storage retina:output TargetedBlock[2] int 1 run scoreboard players get $[z] retina

# Placing position
data modify storage retina:output PlacingPosition set value [0, 0, 0]
execute store result storage retina:output PlacingPosition[0] int 1 run scoreboard players get $previous_[x] retina
execute store result storage retina:output PlacingPosition[1] int 1 run scoreboard players get $previous_[y] retina
execute store result storage retina:output PlacingPosition[2] int 1 run scoreboard players get $previous_[z] retina

# Contact surface
data modify storage retina:output ContactSurface set from storage retina:data ContactSurface

# Contact coordinates
data modify storage retina:output ContactCoordinates set value [0.0d, 0.0d, 0.0d]
execute store result storage retina:output ContactCoordinates[0] double 0.000001 run scoreboard players get $targeted_x retina
execute store result storage retina:output ContactCoordinates[1] double 0.000001 run scoreboard players get $targeted_y retina
execute store result storage retina:output ContactCoordinates[2] double 0.000001 run scoreboard players get $targeted_z retina
scoreboard players operation ${x} retina = $targeted_x retina
scoreboard players operation ${y} retina = $targeted_y retina
scoreboard players operation ${z} retina = $targeted_z retina

# Total distance
scoreboard players operation $block_distance retina *= $1000 retina
scoreboard players operation $total_distance retina += $block_distance retina
execute store result storage retina:output Distance double 0.000001 run scoreboard players get $total_distance retina

# Exit loop
scoreboard players operation $depth retina = $max_depth retina