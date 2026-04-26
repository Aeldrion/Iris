#> iris:raycast/check_intersection/ray_shape
#
# Tests for ray-box intersections with all axis-aligned bounding boxes of a hitbox
#
# @within iris:raycast/test_for_block
# @within iris:raycast/test_for_entity
# @within iris:raycast/check_intersection/ray_shape
# @reads
#   storage iris:data shape
#       A list of axis-aligned bounding boxes of the form {min: [x, y, z], max: [x, y, z]}
# @output
#   Success: 1 if a box is hit, 0 otherwise
#   Result: the distance to the first box that is hit

# Test for intersection with a single bounding box
data modify storage iris:data box set from storage iris:data shape[-1]
data remove storage iris:data shape[-1]
execute store success score $is_hit iris run function iris:raycast/check_intersection/ray_box
execute if score $is_hit iris matches 1 run data modify storage iris:data targeted_box set from storage iris:data box

# Loop this function until all boxes have been analyzed
execute if data storage iris:data shape[-1] run return run function iris:raycast/check_intersection/ray_shape
execute if score $min_distance iris matches 2147483647 run return fail
scoreboard players operation $min_distance iris *= $1000 iris
return run scoreboard players get $min_distance iris
