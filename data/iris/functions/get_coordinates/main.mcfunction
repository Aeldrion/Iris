#> iris:get_coordinates/main
#
# Gets the current coordinates and rotation.
# Coordinates are returned as a triplet of integer coordinates and a triplet of fractional coordinates.
# Rotation is returned as a steering vector of magnitude 1000000.
#
# @context a marker
# @within iris:get_target
# @within iris:get_hitbox/entity
# @output
#	score $[x] iris
#		The integer x coordinate of the current position
#	score $[y] iris
#		The integer y coordinate of the current position
#	score $[z] iris
#		The integer z coordinate of the current position
#	score ${x} iris
#		The fractional x coordinate of the current position, represented by an integer between 0 and 1000000
#	score ${y} iris
#		The fractional y coordinate of the current position, represented by an integer between 0 and 1000000
#	score ${z} iris
#		The fractional z coordinate of the current position, represented by an integer between 0 and 1000000
#	score $dx iris
#		The x coordinate of the steering vector of the ray, represented by an integer between -1000000 and 1000000
#	score $dy iris
#		The y coordinate of the steering vector of the ray, represented by an integer between -1000000 and 1000000
#	score #dz iris
#		The z coordinate of the steering vector of the ray, represented by an integer between -1000000 and 1000000

# Get position (integer coordinates)
data modify storage iris:data Pos set from entity @s Pos
execute store result score $[x] iris run data get storage iris:data Pos[0]
execute store result score $[y] iris run data get storage iris:data Pos[1]
execute store result score $[z] iris run data get storage iris:data Pos[2]

# Get position (fractional coordinates)
scoreboard players set ${x} iris 0
execute store result score ${y} iris run data get storage iris:data Pos[1] 1000000
scoreboard players operation ${y} iris %= $1000000 iris
scoreboard players set ${z} iris 0
execute align x run function iris:get_coordinates/x/0
execute align z run function iris:get_coordinates/z/0

# Get rotation
execute positioned 0.0 0.0 0.0 run teleport @s ^ ^ ^1000000
data modify storage iris:data Pos set from entity @s Pos
execute store result score $dx iris run data get storage iris:data Pos[0]
execute store result score $dy iris run data get storage iris:data Pos[1]
execute store result score $dz iris run data get storage iris:data Pos[2]

# Clean up
data remove storage iris:data Pos
kill @s