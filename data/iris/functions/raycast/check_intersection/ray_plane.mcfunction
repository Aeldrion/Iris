#> iris:raycast/check_intersection/ray_plane
#
# Tests for ray-plane intersections with a face
#
# @reads
#   storage iris:data Face: compound
#       Direction: string
#           The axis that is perpendicular to this face
#           One of WEST_EAST, UP_DOWN, NORTH_SOUTH
#       min: float[]
#       max: float[]
# @output
#   Success: 1 if the face is hit, 0 otherwise
#   Result: the distance, in mm, before the face is hit
# @private
# @within iris:raycast/check_intersection/ray_box

# Save face coordinates
execute store result score $x0 iris run data get storage iris:data Face.min[0] 1000000
execute store result score $y0 iris run data get storage iris:data Face.min[1] 1000000
execute store result score $z0 iris run data get storage iris:data Face.min[2] 1000000
execute store result score $x1 iris run data get storage iris:data Face.max[0] 1000000
execute store result score $y1 iris run data get storage iris:data Face.max[1] 1000000
execute store result score $z1 iris run data get storage iris:data Face.max[2] 1000000

# Get distance (in mm) to the plane, i.e. how long the ray should extend before it hits the plane
# This value should be at most sqrt(3)*1000; if it's more than 2000, we fail (otherwise we risk overflow errors)
execute if data storage iris:data {Face: {Direction: "WEST_EAST"}} run scoreboard players operation $distance iris = $x0 iris
execute if data storage iris:data {Face: {Direction: "WEST_EAST"}} run scoreboard players operation $distance iris -= ${x} iris
execute if data storage iris:data {Face: {Direction: "UP_DOWN"}} run scoreboard players operation $distance iris = $y0 iris
execute if data storage iris:data {Face: {Direction: "UP_DOWN"}} run scoreboard players operation $distance iris -= ${y} iris
execute if data storage iris:data {Face: {Direction: "NORTH_SOUTH"}} run scoreboard players operation $distance iris = $z0 iris
execute if data storage iris:data {Face: {Direction: "NORTH_SOUTH"}} run scoreboard players operation $distance iris -= ${z} iris
scoreboard players operation $distance iris *= $1000 iris
execute if data storage iris:data {Face: {Direction: "WEST_EAST"}} run scoreboard players operation $distance iris /= $dx iris
execute if data storage iris:data {Face: {Direction: "UP_DOWN"}} run scoreboard players operation $distance iris /= $dy iris
execute if data storage iris:data {Face: {Direction: "NORTH_SOUTH"}} run scoreboard players operation $distance iris /= $dz iris
execute if score $distance iris matches ..-1 run return fail
execute if score $distance iris matches 2000.. run return fail

# Get x position of the ray/plane intersection
scoreboard players operation $x_intersection iris = $distance iris
scoreboard players operation $x_intersection iris *= $dx iris
scoreboard players operation $x_intersection iris /= $1000 iris
scoreboard players operation $x_intersection iris += ${x} iris
execute if data storage iris:data {Face: {Direction: "WEST_EAST"}} run scoreboard players operation $x_intersection iris = $x0 iris

# Get y position of the ray/plane intersection
scoreboard players operation $y_intersection iris = $distance iris
scoreboard players operation $y_intersection iris *= $dy iris
scoreboard players operation $y_intersection iris /= $1000 iris
scoreboard players operation $y_intersection iris += ${y} iris
execute if data storage iris:data {Face: {Direction: "UP_DOWN"}} run scoreboard players operation $y_intersection iris = $y0 iris

# Get z position of the ray/plane intersection
scoreboard players operation $z_intersection iris = $distance iris
scoreboard players operation $z_intersection iris *= $dz iris
scoreboard players operation $z_intersection iris /= $1000 iris
scoreboard players operation $z_intersection iris += ${z} iris
execute if data storage iris:data {Face: {Direction: "NORTH_SOUTH"}} run scoreboard players operation $z_intersection iris = $z0 iris

# Save the position of the intersection
data modify storage iris:data Face.Collision set value [0.0d, 0.0d, 0.0d]
execute store result storage iris:data Face.Collision[0] double 0.000001 run scoreboard players get $x_intersection iris
execute store result storage iris:data Face.Collision[1] double 0.000001 run scoreboard players get $y_intersection iris
execute store result storage iris:data Face.Collision[2] double 0.000001 run scoreboard players get $z_intersection iris

# See if that intersection falls within the face
execute if score $x_intersection iris >= $x0 iris if score $x_intersection iris <= $x1 iris \
        if score $y_intersection iris >= $y0 iris if score $y_intersection iris <= $y1 iris \
        if score $z_intersection iris >= $z0 iris if score $z_intersection iris <= $z1 iris \
        run return run scoreboard players get $distance iris

return fail
