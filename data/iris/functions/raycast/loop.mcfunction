# Loops forward until a contact surface is found or until the maximum recursion depth has been reached
# Executed by iris:raycast/on_block_found and by this function itself

# Proceed to the next block
function iris:get_side_of_intersection/main
function iris:find_next_block/main
function iris:set_coordinates/main

# If the new block is not an air block, see if the ray intersects with any of its surfaces
execute at @s unless block ~ ~ ~ #iris:air run function iris:raycast/on_block_found

# Loop this function, if the maximum recursion depth has not been reached yet
scoreboard players add $depth iris 1
execute if score $depth iris < $max_depth iris at @s run function iris:raycast/loop