#> iris:raycast/on_block_found
#
# Runs when the ray enters a non-air block, and identifies whether or not the ray intersects with one of its surfaces
#
# @within iris:raycast/loop
# @context a marker and its position
# @output
#	score $ray_hits_block iris
#		0 or 1. Whether or not the ray hits any surface of the current block.

# Identify the block and get a list of surfaces
data remove storage iris:data Surfaces
function iris:get_hitbox/block

# See if the ray hits any surface
scoreboard players set $ray_hits_surface iris 0
execute if data storage iris:data Surfaces run function iris:find_closest_surface/main
execute if score $ray_hits_surface iris matches 1 run scoreboard players operation $block_distance iris = $min_distance_to_surface iris
scoreboard players operation $ray_hits_block iris = $ray_hits_surface iris