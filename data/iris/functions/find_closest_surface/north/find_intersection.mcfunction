#> iris:find_closest_surface/north/find_intersection
#
# Get position of the intersection, and see if that position is within the current surface
#
# @within iris:find_closest_surface/north/get_distance

# Get x position of the intersection
scoreboard players operation $x_intersection iris = $distance iris
scoreboard players operation $x_intersection iris *= $dx iris
scoreboard players operation $x_intersection iris /= $1000 iris
scoreboard players operation $x_intersection iris += ${x} iris

# Get y position of the intersection
scoreboard players operation $y_intersection iris = $distance iris
scoreboard players operation $y_intersection iris *= $dy iris
scoreboard players operation $y_intersection iris /= $1000 iris
scoreboard players operation $y_intersection iris += ${y} iris

# Get z position of the intersection
scoreboard players operation $z_intersection iris = $z0 iris

# If the ray hits the surface, return this as the minimum distance and the contact surface
execute if score $x_intersection iris >= $x0 iris if score $x_intersection iris <= $x1 iris if score $y_intersection iris >= $y0 iris if score $y_intersection iris <= $y1 iris run function iris:find_closest_surface/ray_intersects_with_surface