#> iris:raycast/loop
#
# Loops forward until a contact surface is found or until the maximum recursion depth has been reached
#
# @context a marker and the current ray position
# @within iris:get_target
# @within iris:raycast/loop

# See if there is a non transparent block or an entity at the current position
execute at @s unless block ~ ~ ~ #iris:air run function iris:raycast/on_block_found
execute at @s if data storage iris:input {TargetEntities: true} if entity @e[type=!#iris:ignore, tag=!iris.executing, dx=0, dy=0, dz=0] run function iris:raycast/on_entity_found

# If the ray hit something, break the loop and return relevant information
execute if score $ray_hits_block iris matches 1 run function iris:raycast/hit_block
execute if score $ray_hits_entity iris matches 1 run function iris:raycast/hit_entity
data remove storage iris:data Surfaces

# Otherwise, proceed to the next block
execute unless score $ray_hits_block iris matches 1 unless score $ray_hits_entity iris matches 1 run function iris:find_next_block/main
execute unless score $ray_hits_block iris matches 1 unless score $ray_hits_entity iris matches 1 run function iris:raycast/teleport_marker

# Loop this function, if the maximum recursion depth has not been reached yet
scoreboard players add $depth iris 1
execute if score $depth iris < $max_depth iris at @s run function iris:raycast/loop
execute if score $depth iris = $max_depth iris run scoreboard players reset $total_distance iris