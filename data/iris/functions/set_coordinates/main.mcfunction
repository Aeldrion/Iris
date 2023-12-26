#> iris:set_coordinates
#
# Teleports the executing entity at a given position from six scores.
# Meant to be executed as the ray marker after raycasting, scores are then set to the player's targeted position:
#    execute as @p at @s anchored eyes positioned ^ ^ ^ run function iris:get_target
#    execute as @e[type=minecraft:marker, tag=iris.ray] run function iris:set_coordinates
#
# @public
# @context any entity
# @input
#   score $[x] iris
#       The integer value of the new X position
#   score ${x} iris
#       The fractional value of the new X position, as a number between 0 and 1000000

execute unless entity @s run return fail

# Clamp to 0..999999
execute if score ${x} iris matches ..0 run scoreboard players set ${x} iris 0
execute if score ${y} iris matches ..0 run scoreboard players set ${y} iris 0
execute if score ${z} iris matches ..0 run scoreboard players set ${z} iris 0
execute if score ${x} iris matches 1000000.. run scoreboard players set ${x} iris 999999
execute if score ${y} iris matches 1000000.. run scoreboard players set ${y} iris 999999
execute if score ${z} iris matches 1000000.. run scoreboard players set ${z} iris 999999

# Get integer coordinates for the first teleport command (absolute coordinates)
execute store result storage iris:args x int 1 run scoreboard players get $[x] iris
execute store result storage iris:args y int 1 run scoreboard players get $[y] iris
execute store result storage iris:args z int 1 run scoreboard players get $[z] iris

# Get fractional coordinates for the second teleport command (relative coordinates)
execute store result storage iris:args value int 1 run scoreboard players get ${x} iris
function iris:set_coordinates/pad_with_zeros with storage iris:args
data modify storage iris:args dx set string storage iris:data String -6

execute store result storage iris:args value int 1 run scoreboard players get ${y} iris
function iris:set_coordinates/pad_with_zeros with storage iris:args
data modify storage iris:args dy set string storage iris:data String -6

execute store result storage iris:args value int 1 run scoreboard players get ${z} iris
function iris:set_coordinates/pad_with_zeros with storage iris:args
data modify storage iris:args dz set string storage iris:data String -6

# Generate the two teleport commands
function iris:set_coordinates/teleport with storage iris:args
