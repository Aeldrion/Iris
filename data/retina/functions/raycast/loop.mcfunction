#> retina:raycast/loop
#
# Loops forward until a contact surface is found or until the maximum recursion depth has been reached
#
# @context a marker and the current ray position
# @within retina:get_target
# @within retina:raycast/loop

# See if there is a non transparent block or an entity at the current position
execute at @s unless block ~ ~ ~ #retina:air run function retina:raycast/on_block_found
execute at @s if data storage retina:input {TargetEntities: true} if entity @e[type=!#retina:ignore, tag=!retina.executing, dx=0, dy=0, dz=0] run function retina:raycast/on_entity_found

# If the ray hit something, break the loop and return relevant information
execute if score $ray_hits_block retina matches 1 run function retina:raycast/hit_block
execute if score $ray_hits_entity retina matches 1 run function retina:raycast/hit_entity
data remove storage retina:data Surfaces

# Otherwise, proceed to the next block
execute unless score $ray_hits_block retina matches 1 unless score $ray_hits_entity retina matches 1 run function retina:find_next_block/main
execute unless score $ray_hits_block retina matches 1 unless score $ray_hits_entity retina matches 1 run function retina:raycast/teleport_marker

# Loop this function, if the maximum recursion depth has not been reached yet
scoreboard players add $depth retina 1
execute if score $depth retina < $max_depth retina at @s run function retina:raycast/loop
execute if score $depth retina = $max_depth retina run scoreboard players reset $total_distance retina