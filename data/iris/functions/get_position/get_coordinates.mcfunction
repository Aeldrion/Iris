#> iris:get_position/get_coordinates
#
# Gets the coordinates of the executing entity
#
# @context A marker
# @within iris:get_position/main
# @within iris:get_hitbox/entity

# Get integer coordinates
data modify storage iris:data Pos set from entity @s Pos
execute store result score $[x] iris store result storage iris:args x int -1 run data get storage iris:data Pos[0]
execute store result score $[y] iris store result storage iris:args y int -1 run data get storage iris:data Pos[1]
execute store result score $[z] iris store result storage iris:args z int -1 run data get storage iris:data Pos[2]

# Get fractional coordinates
function iris:get_position/teleport with storage iris:args
data modify storage iris:data Pos set from entity @s Pos
execute store result score ${x} iris run data get storage iris:data Pos[0] 1000000
execute store result score ${y} iris run data get storage iris:data Pos[1] 1000000
execute store result score ${z} iris run data get storage iris:data Pos[2] 1000000

# Clean up
data remove storage iris:data Pos
kill @s
