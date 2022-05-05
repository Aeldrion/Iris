#> retina:set_coordinates
#
# Teleports the executing entity at a given position from six scores.
# Meant to be executed as the ray marker after raycasting, scores are then set to the player's targeted position:
#	execute as @p at @s anchored eyes positioned ^ ^ ^ run function retina:get_target
#	execute as @e[type=minecraft:marker, tag=retina.ray] run function retina:set_coordinates
#
# @public
# @context an entity other than a player
# @input
#	score $[x] retina
#		The integer value of the new X position
#	score $[y] retina
#		The integer value of the new Y position
#	score $[z] retina
#		The integer value of the new Z position
#	score ${x} retina
#		The fractional value of the new X position, a number between 0 and 1000000
#	score ${y} retina
#		The fractional value of the new Y position, a number between 0 and 1000000
#	score ${z} retina
#		The fractional value of the new Z position, a number between 0 and 1000000

# Teleports the executing entity to the current coordinates

# Calculate y position (this one's fine because there's no risk of overflows)
scoreboard players operation $y retina = $[y] retina
scoreboard players operation $y retina *= $1000000 retina
scoreboard players operation $y retina += ${y} retina

# Save to storage
data modify storage retina:data EntityTag.Pos set value [0.0d, 0.0d, 0.0d]
execute store result storage retina:data EntityTag.Pos[0] double 1 run scoreboard players get $[x] retina
execute store result storage retina:data EntityTag.Pos[1] double 0.000001 run scoreboard players get $y retina
execute store result storage retina:data EntityTag.Pos[2] double 1 run scoreboard players get $[z] retina

# Apply position and also shift position a tiny bit more
data modify entity @s Pos set from storage retina:data EntityTag.Pos
scoreboard players operation $shift_x retina = ${x} retina
scoreboard players operation $shift_z retina = ${z} retina
execute at @s run function retina:set_coordinates/x/0
execute at @s run function retina:set_coordinates/z/0

# Clean up
scoreboard players reset $shift_x retina
scoreboard players reset $shift_z retina