#> iris:set_coordinates
#
# Teleports the executing entity at a given position from six scores.
# Meant to be executed as the ray marker after raycasting, scores are then set to the player's targeted position:
#	execute as @p at @s anchored eyes positioned ^ ^ ^ run function iris:get_target
#	execute as @e[type=minecraft:marker, tag=iris.ray] run function iris:set_coordinates
#
# @public
# @context an entity other than a player
# @input
#	score $[x] iris
#		The integer value of the new X position
#	score $[y] iris
#		The integer value of the new Y position
#	score $[z] iris
#		The integer value of the new Z position
#	score ${x} iris
#		The fractional value of the new X position, a number between 0 and 1000000
#	score ${y} iris
#		The fractional value of the new Y position, a number between 0 and 1000000
#	score ${z} iris
#		The fractional value of the new Z position, a number between 0 and 1000000

# Teleports the executing entity to the current coordinates

# Calculate y position (this one's fine because there's no risk of overflows)
scoreboard players operation $y iris = $[y] iris
scoreboard players operation $y iris *= $1000000 iris
scoreboard players operation $y iris += ${y} iris

# Save to storage
data modify storage iris:data EntityTag.Pos set value [0.0d, 0.0d, 0.0d]
execute store result storage iris:data EntityTag.Pos[0] double 1 run scoreboard players get $[x] iris
execute store result storage iris:data EntityTag.Pos[1] double 0.000001 run scoreboard players get $y iris
execute store result storage iris:data EntityTag.Pos[2] double 1 run scoreboard players get $[z] iris

# Apply position and also shift position a tiny bit more
data modify entity @s Pos set from storage iris:data EntityTag.Pos
scoreboard players operation $shift_x iris = ${x} iris
scoreboard players operation $shift_z iris = ${z} iris
execute at @s run function iris:set_coordinates/x/0
execute at @s run function iris:set_coordinates/z/0

# Clean up
scoreboard players reset $shift_x iris
scoreboard players reset $shift_z iris