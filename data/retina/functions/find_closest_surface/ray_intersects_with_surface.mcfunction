#> retina:find_closest_surface/ray_intersects_with_surface
#
# Establishes the current surface as the first the ray will hit.
# This function only runs if the ray is closer to this surface than it is to any other surface analysed so far, but there is no guarantee that this is the surface the ray will eventually hit first.
#
# @within retina:find_closest_surface/bottom/find_intersection
# @within retina:find_closest_surface/east/find_intersection
# @within retina:find_closest_surface/north/find_intersection
# @within retina:find_closest_surface/south/find_intersection
# @within retina:find_closest_surface/top/find_intersection
# @within retina:find_closest_surface/west/find_intersection

scoreboard players set $ray_hits_surface retina 1
scoreboard players operation $closest_cuboid_id retina = $cuboid_id retina
scoreboard players operation $min_distance_to_surface retina = $distance retina

# The three following scores are eventually sent to output storage
scoreboard players operation $targeted_x retina = $x_intersection retina
scoreboard players operation $targeted_y retina = $y_intersection retina
scoreboard players operation $targeted_z retina = $z_intersection retina

data modify storage retina:data ContactSurface set from storage retina:data List[-1]