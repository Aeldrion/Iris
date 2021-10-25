#> iris:find_closest_surface/bottom/get_distance
#
# Gets distance to the plane containing the surface and determines whether the intersection of the ray on the plane is inside the surface
#
# @within iris:find_closest_surface/bottom/loop

# Get distance to the plane containing the surface
scoreboard players operation $distance iris = $y0 iris
scoreboard players operation $distance iris -= ${y} iris
scoreboard players operation $distance iris *= $1000 iris
scoreboard players operation $distance iris /= $dy iris

# If this distance is closer than the minimum distance to a surface hit by the ray found so far, see if the ray intersects with the surface
execute if score $distance iris < $min_distance_to_surface iris run function iris:find_closest_surface/bottom/find_intersection