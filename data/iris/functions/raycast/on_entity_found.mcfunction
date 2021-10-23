#> iris:raycast/on_entity_found
#
# Runs when an entity's hitbox is within the current block
#
# @within iris:raycast/loop
# @context an entity and the position of the ray marker
# @output
#	score $ray_hits_surface iris
#		0 or 1. Whether or not the ray hits any surface of the entity.

# Identify the block and get a list of surfaces
scoreboard players set $ray_hits_surface iris 0
function iris:get_hitbox/entity