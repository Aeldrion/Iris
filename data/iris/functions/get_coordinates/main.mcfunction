# Gets the current coordinates and rotation:

# [x], [y], [z]: the integer coordinates of the current position, originally set to the executing position
# {x}, {y}, {z}: the fractional coordinates of the current position, represented by an integer between 0 and 1000000
# dx,  dy,  dz:  the steering vector of the ray, i.e. the executing rotation

summon minecraft:area_effect_cloud ~ ~ ~ {Tags: ["iris", "iris.get_coordinates"]}
execute as @e[type=minecraft:area_effect_cloud, tag=iris.get_coordinates, limit=1] run function iris:get_coordinates/as_marker_entity