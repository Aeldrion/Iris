# Contact surface: the surface of the block the ray hits (six coordinates between 0 and 1000000, where 0 0 0 and 1000000 1000000 1000000 are opposite corners of the block)
data modify storage iris:output ContactSurface set from storage iris:data ContactSurface

# Contact coordinates: the exact position where the ray hits a surface (three coordinates between 0 and 1000000, where 0 0 0 and 1000000 1000000 1000000 are opposite corners of the block)
data modify storage iris:output ContactCoordinates set value [0.0d, 0.0d, 0.0d]
execute store result storage iris:output ContactCoordinates[0] double 0.000001 run scoreboard players get $targeted_x iris
execute store result storage iris:output ContactCoordinates[1] double 0.000001 run scoreboard players get $targeted_y iris
execute store result storage iris:output ContactCoordinates[2] double 0.000001 run scoreboard players get $targeted_z iris

# Targeted block: the integer coordinates of the block that the ray finds itself in when it hits something (i.e. the "targeted block")
data modify storage iris:output TargetedBlock set value [0, 0, 0]
execute store result storage iris:output TargetedBlock[0] int 1 run scoreboard players get $[x] iris
execute store result storage iris:output TargetedBlock[1] int 1 run scoreboard players get $[y] iris
execute store result storage iris:output TargetedBlock[2] int 1 run scoreboard players get $[z] iris

# Placing position: the integer coordinates of the block before the ray hits something (i.e. where a block would be placed, if the player were to place a block)
data modify storage iris:output PlacingPosition set value [0, 0, 0]
execute store result storage iris:output PlacingPosition[0] int 1 run scoreboard players get $previous_[x] iris
execute store result storage iris:output PlacingPosition[1] int 1 run scoreboard players get $previous_[y] iris
execute store result storage iris:output PlacingPosition[2] int 1 run scoreboard players get $previous_[z] iris

# Exit loop
scoreboard players operation $depth iris = $max_depth iris