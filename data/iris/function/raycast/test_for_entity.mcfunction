#> iris:raycast/test_for_entity
#
# @output
#   Result: 0
#   Success: 1 if an entity was hit, 0 otherwise

execute unless data storage iris:settings {TargetEntities: true} run return fail
execute align xyz unless entity @e[type=!#iris:ignore, tag=!iris.ignore, dx=0, dy=0, dz=0, tag=!iris.executing] run return fail
execute align xyz as @e[type=!#iris:ignore, tag=!iris.ignore, dx=0, dy=0, dz=0, tag=!iris.executing] run function iris:get_hitbox/entity
return run function iris:raycast/check_intersection/loop
