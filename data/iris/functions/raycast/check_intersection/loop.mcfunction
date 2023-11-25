#> iris:raycast/check_intersection/loop
#
# Tests for ray-box intersections with all axis-aligned bounding boxes of a hitbox
#
# @reads
#   storage iris:data Shape
#       A list of axis-aligned bounding boxes of the form {min: [x, y, z], max: [x, y, z]}
# @output
#   Success: 1 if a box is hit, 0 otherwise
#   Result: the distance to the first box that is hit
# @private
# @within iris:raycast/test_for_block
# @within iris:raycast/test_for_entity
# @within iris:raycast/check_intersection/loop

# Test for intersection with a single bounding box
data modify storage iris:data Box set from storage iris:data Shape[-1]
data remove storage iris:data Shape[-1]
execute store success score $is_hit iris store result score $distance iris run function iris:raycast/check_intersection/ray_box

# If this box is indeed hit before any other this far, remember it
execute if score $is_hit iris matches 1 if score $distance iris >= $min_distance iris run scoreboard players set $is_hit iris 0
execute if score $is_hit iris matches 1 run data modify storage iris:data TargetedBox set from storage iris:data Box
execute if score $is_hit iris matches 1 run scoreboard players operation $min_distance iris = $distance iris

# Loop this function until all boxes have been analyzed
execute if data storage iris:data Shape[-1] run return run function iris:raycast/check_intersection/loop
execute if score $min_distance iris matches 2147483647 run return fail
return run scoreboard players get $min_distance iris
