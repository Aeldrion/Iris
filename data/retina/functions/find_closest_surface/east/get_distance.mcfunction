#> retina:find_closest_surface/east/get_distance
#
# Gets distance to the plane containing the surface and determines whether the intersection of the ray on the plane is inside the surface
#
# @within retina:find_closest_surface/east/loop

# Get distance to the plane containing the surface
scoreboard players operation $distance retina = $x0 retina
scoreboard players operation $distance retina -= ${x} retina
scoreboard players operation $distance retina *= $1000 retina
scoreboard players operation $distance retina /= $dx retina

# If this distance is closer than the minimum distance to a surface hit by the ray found so far, see if the ray intersects with the surface
execute if score $distance retina < $min_distance_to_surface retina run function retina:find_closest_surface/east/find_intersection