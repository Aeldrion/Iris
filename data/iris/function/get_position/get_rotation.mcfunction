#> iris:get_position/get_rotation
#
# Returns the rotation from context as a vector
#
# @context A marker and a rotation
# @within iris:get_target
# @writes
#    score $dx iris
#        The x coordinate of the steering vector of the ray, represented by an integer between -1000000 and 1000000
#    score $dy iris
#        The y coordinate of the steering vector of the ray, represented by an integer between -1000000 and 1000000
#    score #dz iris
#        The z coordinate of the steering vector of the ray, represented by an integer between -1000000 and 1000000

# Teleport forward from origin and get position
execute positioned 0.0 0.0 0.0 run teleport @s ^ ^ ^1000000
data modify storage iris:data position set from entity @s Pos
execute store result score $dx iris run data get storage iris:data position[0]
execute store result score $dy iris run data get storage iris:data position[1]
execute store result score $dz iris run data get storage iris:data position[2]

# Clean up
data remove storage iris:data position
teleport @s ~ -1000 ~
kill @s
