#> iris:raycast/teleport_marker
#
# Sets coordinates of the ray marker to the calculated block coordinates (int only)
# The entity is teleported at the corner of the block
#
# @within iris:raycast/loop
# @context a marker
# @input
#	score $[x] iris
#		The integer x coordinate
#	score $[y] iris
#		The integer y coordinate
#	score $[z] iris
#		The integer z coordinate

# Save to storage
data modify storage iris:data EntityTag.Pos set value [0.0d, 0.0d, 0.0d]
execute store result storage iris:data EntityTag.Pos[0] double 1 run scoreboard players get $[x] iris
execute store result storage iris:data EntityTag.Pos[1] double 1 run scoreboard players get $[y] iris
execute store result storage iris:data EntityTag.Pos[2] double 1 run scoreboard players get $[z] iris

# Apply position
data modify entity @s Pos set from storage iris:data EntityTag.Pos