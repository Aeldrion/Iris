# Runs when the ray enters a non-air block, and identifies whether or not the ray intersects with one of its surfaces
# Executed by iris:raycast/loop

# Identify the block and get a list of surfaces
scoreboard players set $ray_hits_surface iris 0
function iris:get_block_surfaces/main

# Determine whether or not the ray hits a surface, and if it does, identify the closest surface and stop the loop
execute if data storage iris:block Surfaces run function iris:find_closest_surface/main
execute if score $ray_hits_surface iris matches 1 run function iris:raycast/end_loop
data remove storage iris:block Surfaces