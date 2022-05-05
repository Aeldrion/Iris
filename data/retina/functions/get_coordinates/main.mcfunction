#> retina:get_coordinates/main
#
# Gets the current coordinates and rotation.
# Coordinates are returned as a triplet of integer coordinates and a triplet of fractional coordinates.
# Rotation is returned as a steering vector of magnitude 1000000.
#
# @context a position and a rotation
# @within retina:get_target
# @within retina:get_hitbox/entity
# @output
#	score $[x] retina
#		The integer x coordinate of the current position
#	score $[y] retina
#		The integer y coordinate of the current position
#	score $[z] retina
#		The integer z coordinate of the current position
#	score ${x} retina
#		The fractional x coordinate of the current position, represented by an integer between 0 and 1000000
#	score ${y} retina
#		The fractional y coordinate of the current position, represented by an integer between 0 and 1000000
#	score ${z} retina
#		The fractional z coordinate of the current position, represented by an integer between 0 and 1000000
#	score $dx retina
#		The x coordinate of the steering vector of the ray, represented by an integer between -1000000 and 1000000
#	score $dy retina
#		The y coordinate of the steering vector of the ray, represented by an integer between -1000000 and 1000000
#	score #dz retina
#		The z coordinate of the steering vector of the ray, represented by an integer between -1000000 and 1000000

summon minecraft:marker ~ ~ ~ {Tags: ["retina", "retina.get_coordinates"]}
execute as @e[type=minecraft:marker, tag=retina.get_coordinates, limit=1] run function retina:get_coordinates/as_marker