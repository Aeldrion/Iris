#> iris:is_in_block
#
# Returns whether the executing position is within the hitbox of a block
#
# @public

execute summon minecraft:marker run function iris:get_position/get_coordinates
function iris:get_hitbox/block
execute unless data storage iris:data shape[-1] run return fail
return run function iris:raycast/check_intersection/point_shape
