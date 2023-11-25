#> iris:raycast/test_for_entity
#
# @output
#   Result: 0
#   Success: 1 if an entity was hit, 0 otherwise

execute unless data storage iris:settings {TargetEntities: true} run return fail
execute unless entity @e[dx=0, dy=0, dz=0, tag=!iris.ray, tag=!iris.executing] run return fail
execute as @e[dx=0, dy=0, dz=0, tag=!iris.ray, tag=!iris.executing] run function iris:get_hitbox/entity
return run function iris:raycast/check_intersection/loop
