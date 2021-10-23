#> iris:raycast/on_block_found
#
# Runs when the ray enters a non-air block, and identifies whether or not the ray intersects with one of its surfaces
#
# @within iris:raycast/loop
# @context a marker and its position
# @output
#	score $ray_hits_surface iris
#		0 or 1. Whether or not the ray hits any surface of the current block.

# Identify the block and get a list of surfaces
scoreboard players set $ray_hits_surface iris 0
function iris:get_hitbox/block
