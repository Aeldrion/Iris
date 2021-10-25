#> iris:raycast/on_entity_found
#
# Runs when an entity's hitbox is partly within the current block, and identifies whether or not the ray intersects with one of its surfaces
#
# @within iris:raycast/loop
# @context an entity and the position of the ray marker
# @output
#	score $ray_hits_entity iris
#		0 or 1. Whether or not the ray hits any surface of the entity.
#	score $closest_entity iris
#		The ID of the entity that is hit on iris.id.

# Identify the entity and get a list of surfaces
scoreboard players set $max iris.id 0
tag @e[type=!#iris:ignore] remove iris.possible_target
data remove storage iris:data Surfaces
execute as @e[type=!#iris:ignore, tag=!iris.executing, dx=0, dy=0, dz=0] run function iris:get_hitbox/entity

# See if the ray hits any surface
scoreboard players set $ray_hits_surface iris 0
execute if data storage iris:data Surfaces run function iris:find_closest_surface/main
execute if score $ray_hits_surface iris matches 1 run scoreboard players operation $entity_distance iris = $min_distance_to_surface iris
scoreboard players operation $ray_hits_entity iris = $ray_hits_surface iris

# If the ray could hit both an entity and a block, remember only the one that comes first
execute if score $ray_hits_entity iris matches 1 if score $ray_hits_block iris matches 1 if score $entity_distance iris < $block_distance iris run scoreboard players set $ray_hits_block iris 0
execute if score $ray_hits_entity iris matches 1 if score $ray_hits_block iris matches 1 if score $entity_distance iris >= $block_distance iris run scoreboard players set $ray_hits_entity iris 0