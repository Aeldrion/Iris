#> iris:raycast/loop
#
# Loops forward until a contact surface is found or until the maximum recursion depth has been reached
#
# @context a marker and the current ray position
# @within iris:get_target
# @within iris:raycast/loop

# Test for collisions
execute store success score $block_hit iris store result score $block_distance iris run function iris:raycast/test_for_block
execute store success score $entity_hit iris store result score $entity_distance iris run function iris:raycast/test_for_entity
execute if score $block_hit iris matches 1 run return run function iris:raycast/on_hit
execute if score $entity_hit iris matches 1 run return run function iris:raycast/on_hit

# Proceed to the next block
execute store result score $to_next_block iris run function iris:raycast/find_next_block
scoreboard players operation $total_distance iris += $to_next_block iris
function iris:raycast/teleport_marker

# Loop this function until a collision happens or the maximum recursion depth is reached
scoreboard players add $depth iris 1
execute if score $depth iris < $max_depth iris at @s run return run function iris:raycast/loop

# If nothing was found, fail
tag @s remove iris.executing
return fail
