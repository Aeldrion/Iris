#> iris:get_position/override_coordinates
#
# @within iris:get_position/main


# Get integer coordinates
execute store result score $[x] iris store result storage iris:args x int -1 run data get storage iris:data OverrideCoordinates[0]
execute store result score $[y] iris store result storage iris:args y int -1 run data get storage iris:data OverrideCoordinates[1]
execute store result score $[z] iris store result storage iris:args z int -1 run data get storage iris:data OverrideCoordinates[2]

# Get fractional coordinates
execute store result score ${x} iris run data get storage iris:data OverrideCoordinates[0] 1000000
execute store result score ${y} iris run data get storage iris:data OverrideCoordinates[1] 1000000
execute store result score ${z} iris run data get storage iris:data OverrideCoordinates[2] 1000000

