#> iris:raycast/loop
#
# Loops forward until a contact surface is found or until the maximum recursion depth has been reached
#
# @context a marker and the current ray position
# @within iris:get_targeted_block
# @within iris:raycast/loop

# Proceed to the next block
function iris:find_next_block/main
function iris:set_coordinates/main

# See if there is a non transparent block or an entity at the new position
data remove storage iris:block Surfaces
execute at @s unless block ~ ~ ~ #iris:air run function iris:raycast/on_block_found
execute at @s if data storage iris:input {TargetEntities: true} as @e[tag=!iris.executing, type=!#iris:ignore, dx=0, dy=0, dz=0] run function iris:raycast/on_entity_found

# See if the ray hits any surface
scoreboard players set $ray_hits_surface iris 0
execute if data storage iris:block Surfaces run function iris:find_closest_surface/main
execute if score $ray_hits_surface iris matches 1 run function iris:raycast/hit
data remove storage iris:block Surfaces

# Loop this function, if the maximum recursion depth has not been reached yet
scoreboard players add $depth iris 1
execute if score $depth iris < $max_depth iris at @s run function iris:raycast/loop
execute if score $depth iris = $max_depth iris run scoreboard players reset $total_distance iris