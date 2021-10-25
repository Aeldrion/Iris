#> iris:find_closest_surface/east/find_intersection
#
# Get position of the intersection, and see if that position is within the current surface
#
# @within iris:find_closest_surface/east/get_distance

# Get x position of the intersection
scoreboard players operation $x_intersection iris = $x0 iris

# Get y position of the intersection
scoreboard players operation $y_intersection iris = $distance iris
scoreboard players operation $y_intersection iris *= $dy iris
scoreboard players operation $y_intersection iris /= $1000 iris
scoreboard players operation $y_intersection iris += ${y} iris

# Get z position of the intersection
scoreboard players operation $z_intersection iris = $distance iris
scoreboard players operation $z_intersection iris *= $dz iris
scoreboard players operation $z_intersection iris /= $1000 iris
scoreboard players operation $z_intersection iris += ${z} iris

# If the ray hits the surface, return this as the minimum distance and the contact surface
execute if score $y_intersection iris >= $y0 iris if score $y_intersection iris <= $y1 iris if score $z_intersection iris >= $z0 iris if score $z_intersection iris <= $z1 iris run function iris:find_closest_surface/ray_intersects_with_surface