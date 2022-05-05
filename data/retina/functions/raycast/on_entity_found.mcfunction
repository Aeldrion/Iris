#> retina:raycast/on_entity_found
#
# Runs when an entity's hitbox is partly within the current block, and identifies whether or not the ray intersects with one of its surfaces
#
# @within retina:raycast/loop
# @context an entity and the position of the ray marker
# @output
#	score $ray_hits_entity retina
#		0 or 1. Whether or not the ray hits any surface of the entity.
#	score $closest_entity retina
#		The ID of the entity that is hit on retina.id.

# Identify the entity and get a list of surfaces
scoreboard players set $max retina.id 0
tag @e[type=!#retina:ignore] remove retina.possible_target
data remove storage retina:data Surfaces
execute as @e[type=!#retina:ignore, tag=!retina.executing, dx=0, dy=0, dz=0] run function retina:get_hitbox/entity

# See if the ray hits any surface
scoreboard players set $ray_hits_surface retina 0
execute if data storage retina:data Surfaces run function retina:find_closest_surface/main
execute if score $ray_hits_surface retina matches 1 run scoreboard players operation $entity_distance retina = $min_distance_to_surface retina
scoreboard players operation $ray_hits_entity retina = $ray_hits_surface retina

# If the ray could hit both an entity and a block, remember only the one that comes first
execute if score $ray_hits_entity retina matches 1 if score $ray_hits_block retina matches 1 if score $entity_distance retina < $block_distance retina run scoreboard players set $ray_hits_block retina 0
execute if score $ray_hits_entity retina matches 1 if score $ray_hits_block retina matches 1 if score $entity_distance retina >= $block_distance retina run scoreboard players set $ray_hits_entity retina 0