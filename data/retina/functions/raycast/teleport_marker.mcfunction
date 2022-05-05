#> retina:raycast/teleport_marker
#
# Sets coordinates of the ray marker to the calculated block coordinates (int only)
# The entity is teleported at the corner of the block
#
# @within retina:raycast/loop
# @context a marker
# @input
#	score $[x] retina
#		The integer x coordinate
#	score $[y] retina
#		The integer y coordinate
#	score $[z] retina
#		The integer z coordinate

# Save to storage
data modify storage retina:data EntityTag.Pos set value [0.0d, 0.0d, 0.0d]
execute store result storage retina:data EntityTag.Pos[0] double 1 run scoreboard players get $[x] retina
execute store result storage retina:data EntityTag.Pos[1] double 1 run scoreboard players get $[y] retina
execute store result storage retina:data EntityTag.Pos[2] double 1 run scoreboard players get $[z] retina

# Apply position
data modify entity @s Pos set from storage retina:data EntityTag.Pos