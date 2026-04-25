#> iris:get_position/get_coordinates
#
# Gets the coordinates of the executing entity
#
# @context A marker and a position
# @within iris:get_target
# @within iris:get_hitbox/entity
# @writes
#    score $[x] iris
#        The integer x coordinate of the current position
#    score $[y] iris
#        The integer y coordinate of the current position
#    score $[z] iris
#        The integer z coordinate of the current position
#    score ${x} iris
#        The fractional x coordinate of the current position, represented by an integer between 0 and 1000000
#    score ${y} iris
#        The fractional y coordinate of the current position, represented by an integer between 0 and 1000000
#    score ${z} iris
#        The fractional z coordinate of the current position, represented by an integer between 0 and 1000000

# Get integer coordinates
data modify storage iris:data position set from entity @s Pos
execute store result score $[x] iris store result storage iris:args x int -1 run data get storage iris:data position[0]
execute store result score $[y] iris store result storage iris:args y int -1 run data get storage iris:data position[1]
execute store result score $[z] iris store result storage iris:args z int -1 run data get storage iris:data position[2]

# Get fractional coordinates
function iris:get_position/teleport with storage iris:args
data modify storage iris:data position set from entity @s Pos
execute store result score ${x} iris run data get storage iris:data position[0] 1000000
execute store result score ${y} iris run data get storage iris:data position[1] 1000000
execute store result score ${z} iris run data get storage iris:data position[2] 1000000

# Clean up
data remove storage iris:data position
teleport @s ~ -1000 ~
kill @s
