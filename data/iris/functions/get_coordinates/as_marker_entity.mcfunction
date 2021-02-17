# Gets the current coordinates and rotation, executed as/at an area effect cloud by iris:get_coordinates/main

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
execute positioned 0 0 0 rotated ~ ~ run teleport @s ^ ^ ^1000000
data modify storage iris:data Pos set from entity @s Pos
execute store result score $dx iris run data get storage iris:data Pos[0]
execute store result score $dy iris run data get storage iris:data Pos[1]
execute store result score $dz iris run data get storage iris:data Pos[2]

# Clean up
data remove storage iris:data Pos
kill @s