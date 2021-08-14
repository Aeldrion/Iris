#> iris:find_closest_surface/ray_already_in_surface
#
# Establishes the current surface as the first the ray will hit.
# This function only runs if the ray is already within a surface, guaranteeing that this surface is the contact surface.
#
# @within iris:find_closest_surface/bottom/find_intersection
# @within iris:find_closest_surface/east/find_intersection
# @within iris:find_closest_surface/north/find_intersection
# @within iris:find_closest_surface/south/find_intersection
# @within iris:find_closest_surface/top/find_intersection
# @within iris:find_closest_surface/west/find_intersection

scoreboard players set $ray_hits_surface iris 1
scoreboard players set $min_distance_to_surface iris 0
data modify storage iris:data ContactSurface set from storage iris:data List[-1]

# The three following scores are eventually sent to output storage
scoreboard players operation $targeted_x iris = ${x} iris
scoreboard players operation $targeted_y iris = ${y} iris
scoreboard players operation $targeted_z iris = ${z} iris