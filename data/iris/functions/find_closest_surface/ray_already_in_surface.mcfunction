#> iris:find_closest_surface/ray_already_in_surface
#
# Establishes the current surface as the first the ray will hit.
# This function only runs if the ray is already within a surface, guaranteeing that this surface is the contact surface.
#
# @within iris:find_closest_surface/bottom/loop
# @within iris:find_closest_surface/east/loop
# @within iris:find_closest_surface/north/loop
# @within iris:find_closest_surface/south/loop
# @within iris:find_closest_surface/top/loop
# @within iris:find_closest_surface/west/loop

scoreboard players set $ray_hits_surface iris 1
scoreboard players operation $closest_cuboid_id iris = $cuboid_id iris
scoreboard players set $min_distance_to_surface iris 0
data modify storage iris:data ContactSurface set from storage iris:data List[-1]

# The three following scores are eventually sent to output storage
scoreboard players operation $targeted_x iris = ${x} iris
scoreboard players operation $targeted_y iris = ${y} iris
scoreboard players operation $targeted_z iris = ${z} iris