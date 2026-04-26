#> iris:raycast/loop
#
# Loops forward until an obstacle is hit or until the maximum distance has been reached
#
# @context a marker and the current ray position
# @within iris:get_target
# @within iris:raycast/loop

# Test for collisions
execute store success score $block_hit iris store result score $block_distance iris run function iris:raycast/test_for_block
execute store success score $entity_hit iris store result score $entity_distance iris run function iris:raycast/test_for_entity
execute if score $block_hit iris matches 1 run return run function iris:raycast/on_hit
execute if score $entity_hit iris matches 1 run return run function iris:raycast/on_hit

# Proceed to the next block
execute store result score $to_next_block iris run function iris:raycast/find_next_block
scoreboard players operation $total_distance iris += $to_next_block iris

# If the maximum distance is reached and nothing was found, fail
execute if score $total_distance iris > $max_distance iris run return fail

# Otherwise, loop this function at the next block
execute if data storage iris:data {move_along: "x"} if score $dx iris matches 0.. positioned ~1 ~ ~ run return run function iris:raycast/loop
execute if data storage iris:data {move_along: "x"} if score $dx iris matches ..-1 positioned ~-1 ~ ~ run return run function iris:raycast/loop
execute if data storage iris:data {move_along: "y"} if score $dy iris matches 0.. positioned ~ ~1 ~ run return run function iris:raycast/loop
execute if data storage iris:data {move_along: "y"} if score $dy iris matches ..-1 positioned ~ ~-1 ~ run return run function iris:raycast/loop
execute if data storage iris:data {move_along: "z"} if score $dz iris matches 0.. positioned ~ ~ ~1 run return run function iris:raycast/loop
execute if data storage iris:data {move_along: "z"} if score $dz iris matches ..-1 positioned ~ ~ ~-1 run return run function iris:raycast/loop
