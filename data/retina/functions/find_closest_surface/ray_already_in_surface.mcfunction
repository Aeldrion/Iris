#> retina:find_closest_surface/ray_already_in_surface
#
# Establishes the current surface as the first the ray will hit.
# This function only runs if the ray is already within a surface, guaranteeing that this surface is the contact surface.
#
# @within retina:find_closest_surface/bottom/loop
# @within retina:find_closest_surface/east/loop
# @within retina:find_closest_surface/north/loop
# @within retina:find_closest_surface/south/loop
# @within retina:find_closest_surface/top/loop
# @within retina:find_closest_surface/west/loop

scoreboard players set $ray_hits_surface retina 1
scoreboard players operation $closest_cuboid_id retina = $cuboid_id retina
scoreboard players set $min_distance_to_surface retina 0
data modify storage retina:data ContactSurface set from storage retina:data List[-1]

# The three following scores are eventually sent to output storage
scoreboard players operation $targeted_x retina = ${x} retina
scoreboard players operation $targeted_y retina = ${y} retina
scoreboard players operation $targeted_z retina = ${z} retina