#> retina:get_coordinates/as_marker
#
# Gets the current coordinates and rotation using a marker.
#
# @context a marker entity at context position and a rotation
# @within retina:get_coordinates/main

# Get position (integer coordinates)
data modify storage retina:data Pos set from entity @s Pos
execute store result score $[x] retina run data get storage retina:data Pos[0]
execute store result score $[y] retina run data get storage retina:data Pos[1]
execute store result score $[z] retina run data get storage retina:data Pos[2]

# Get position (fractional coordinates)
scoreboard players set ${x} retina 0
execute store result score ${y} retina run data get storage retina:data Pos[1] 1000000
scoreboard players operation ${y} retina %= $1000000 retina
scoreboard players set ${z} retina 0
execute align x run function retina:get_coordinates/x/0
execute align z run function retina:get_coordinates/z/0

# Get rotation
execute positioned 0.0 0.0 0.0 run teleport @s ^ ^ ^1000000
data modify storage retina:data Pos set from entity @s Pos
execute store result score $dx retina run data get storage retina:data Pos[0]
execute store result score $dy retina run data get storage retina:data Pos[1]
execute store result score $dz retina run data get storage retina:data Pos[2]

# Clean up
data remove storage retina:data Pos
kill @s