#> retina:raycast/on_block_found
#
# Runs when the ray enters a non-air block, and identifies whether or not the ray intersects with one of its surfaces
#
# @within retina:raycast/loop
# @context a marker and its position
# @output
#	score $ray_hits_block retina
#		0 or 1. Whether or not the ray hits any surface of the current block.

# Identify the block and get a list of surfaces
data remove storage retina:data Surfaces
function retina:get_hitbox/block

# See if the ray hits any surface
scoreboard players set $ray_hits_surface retina 0
execute if data storage retina:data Surfaces run function retina:find_closest_surface/main
execute if score $ray_hits_surface retina matches 1 run scoreboard players operation $block_distance retina = $min_distance_to_surface retina
scoreboard players operation $ray_hits_block retina = $ray_hits_surface retina