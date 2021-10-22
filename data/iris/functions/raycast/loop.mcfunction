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

# If the new block is not an air block, see if the ray intersects with any of its surfaces
execute at @s unless block ~ ~ ~ #iris:air run function iris:raycast/on_block_found

# Loop this function, if the maximum recursion depth has not been reached yet
scoreboard players add $depth iris 1
execute if score $depth iris < $max_depth iris at @s run function iris:raycast/loop
execute if score $depth iris = $max_depth iris run scoreboard players reset $total_distance iris