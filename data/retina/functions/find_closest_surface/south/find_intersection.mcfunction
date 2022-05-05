#> retina:find_closest_surface/south/find_intersection
#
# Get position of the intersection, and see if that position is within the current surface
#
# @within retina:find_closest_surface/south/get_distance

# Get x position of the intersection
scoreboard players operation $x_intersection retina = $distance retina
scoreboard players operation $x_intersection retina *= $dx retina
scoreboard players operation $x_intersection retina /= $1000 retina
scoreboard players operation $x_intersection retina += ${x} retina

# Get y position of the intersection
scoreboard players operation $y_intersection retina = $distance retina
scoreboard players operation $y_intersection retina *= $dy retina
scoreboard players operation $y_intersection retina /= $1000 retina
scoreboard players operation $y_intersection retina += ${y} retina

# Get z position of the intersection
scoreboard players operation $z_intersection retina = $z0 retina

# If the ray hits the surface, return this as the minimum distance and the contact surface
execute if score $x_intersection retina >= $x0 retina if score $x_intersection retina <= $x1 retina if score $y_intersection retina >= $y0 retina if score $y_intersection retina <= $y1 retina run function retina:find_closest_surface/ray_intersects_with_surface