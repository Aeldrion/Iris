#> iris:raycast/test_for_entity
#
# @within iris:raycast/loop
# @output
#   Result: 0
#   Success: 1 if an entity was hit, 0 otherwise

execute unless data storage iris:settings {target_entities: true} run return fail
execute align xyz unless entity @e[tag=!iris.ignore, dx=0, dy=0, dz=0, tag=!iris.executing] run return fail
execute align xyz as @e[tag=!iris.ignore, dx=0, dy=0, dz=0, tag=!iris.executing] run function iris:get_hitbox/entity
return run function iris:raycast/check_intersection/ray_shape
