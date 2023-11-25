#> iris:raycast/check_intersection/ray_plane
#
# Tests for ray-plane intersections with a surface
#
# @reads
#   storage iris:data Surface: compound
#       min: float[]
#       max: float[]
# @output
#   Success: 1 if the surface is hit, 0 otherwise
#   Result: the distance, in mm, before the surface is hit
# @private
# @within iris:raycast/check_intersection/ray_box

# Save surface coordinates
execute store result score $x0 iris run data get storage iris:data Surface.min[0] 1000000
execute store result score $y0 iris run data get storage iris:data Surface.min[1] 1000000
execute store result score $z0 iris run data get storage iris:data Surface.min[2] 1000000
execute store result score $x1 iris run data get storage iris:data Surface.max[0] 1000000
execute store result score $y1 iris run data get storage iris:data Surface.max[1] 1000000
execute store result score $z1 iris run data get storage iris:data Surface.max[2] 1000000

# Identify the direction of the surface ("WEST_EAST" means that the surface extends in all directions except west and east)
execute if score $x0 iris = $x1 iris run data modify storage iris:data SurfaceDirection set value "WEST_EAST"
execute if score $y0 iris = $y1 iris run data modify storage iris:data SurfaceDirection set value "UP_DOWN"
execute if score $z0 iris = $z1 iris run data modify storage iris:data SurfaceDirection set value "NORTH_SOUTH"

# Test if the ray is already inside the surface
execute if data storage iris:data {SurfaceDirection: "WEST_EAST"} if score ${x} iris = $x0 iris if score ${y} iris >= $y0 iris if score ${y} iris <= $y1 iris if score ${z} iris >= $z0 iris if score ${z} iris <= $z1 iris run return 0
execute if data storage iris:data {SurfaceDirection: "UP_DOWN"} if score ${y} iris = $y0 iris if score ${x} iris >= $x0 iris if score ${x} iris <= $x1 iris if score ${z} iris >= $z0 iris if score ${z} iris <= $z1 iris run return 0
execute if data storage iris:data {SurfaceDirection: "NORTH_SOUTH"} if score ${z} iris = $z0 iris if score ${x} iris >= $x0 iris if score ${x} iris <= $x1 iris if score ${y} iris >= $y0 iris if score ${y} iris <= $y1 iris run return 0

# If it is not, see where the intersection between the plane and the ray would be
    # Get distance to the plane, i.e. how long the ray should extend before it hits the ray
execute if data storage iris:data {SurfaceDirection: "WEST_EAST"} run scoreboard players operation $distance iris = $x0 iris
execute if data storage iris:data {SurfaceDirection: "WEST_EAST"} run scoreboard players operation $distance iris -= ${x} iris
execute if data storage iris:data {SurfaceDirection: "UP_DOWN"} run scoreboard players operation $distance iris = $y0 iris
execute if data storage iris:data {SurfaceDirection: "UP_DOWN"} run scoreboard players operation $distance iris -= ${y} iris
execute if data storage iris:data {SurfaceDirection: "NORTH_SOUTH"} run scoreboard players operation $distance iris = $z0 iris
execute if data storage iris:data {SurfaceDirection: "NORTH_SOUTH"} run scoreboard players operation $distance iris -= ${z} iris
scoreboard players operation $distance iris *= $1000 iris
execute if data storage iris:data {SurfaceDirection: "WEST_EAST"} run scoreboard players operation $distance iris /= $dx iris
execute if data storage iris:data {SurfaceDirection: "UP_DOWN"} run scoreboard players operation $distance iris /= $dy iris
execute if data storage iris:data {SurfaceDirection: "NORTH_SOUTH"} run scoreboard players operation $distance iris /= $dz iris
execute if score $distance iris matches ..-1 run return fail

    # Get x position of the ray/plane intersection
scoreboard players operation $x_intersection iris = $distance iris
scoreboard players operation $x_intersection iris *= $dx iris
scoreboard players operation $x_intersection iris /= $1000 iris
scoreboard players operation $x_intersection iris += ${x} iris
execute if data storage iris:data {SurfaceDirection: "WEST_EAST"} run scoreboard players operation $x_intersection iris = $x0 iris

    # Get y position of the ray/plane intersection
scoreboard players operation $y_intersection iris = $distance iris
scoreboard players operation $y_intersection iris *= $dy iris
scoreboard players operation $y_intersection iris /= $1000 iris
scoreboard players operation $y_intersection iris += ${y} iris
execute if data storage iris:data {SurfaceDirection: "UP_DOWN"} run scoreboard players operation $y_intersection iris = $y0 iris

    # Get z position of the ray/plane intersection
scoreboard players operation $z_intersection iris = $distance iris
scoreboard players operation $z_intersection iris *= $dz iris
scoreboard players operation $z_intersection iris /= $1000 iris
scoreboard players operation $z_intersection iris += ${z} iris
execute if data storage iris:data {SurfaceDirection: "NORTH_SOUTH"} run scoreboard players operation $z_intersection iris = $z0 iris

# See if that intersection falls within the surface
execute if score $x_intersection iris >= $x0 iris if score $x_intersection iris <= $x1 iris \
        if score $y_intersection iris >= $y0 iris if score $y_intersection iris <= $y1 iris \
        if score $z_intersection iris >= $z0 iris if score $z_intersection iris <= $z1 iris \
        run return run scoreboard players get $distance iris

return fail
