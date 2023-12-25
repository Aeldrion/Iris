#> iris:raycast/loop
#
# Loops forward until an obstacle is hit or until the maximum recursion depth has been reached
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

# Fail if the maximum recursion depth is reached and nothing was found
scoreboard players add $depth iris 1
execute if score $depth iris = $max_depth iris run tag @s remove iris.executing
execute if score $depth iris = $max_depth iris run return fail

# Otherwise, loop this function at the next block
execute if data storage iris:data {NextCoordinateChange: "x"} if score $dx iris matches 0.. positioned ~1 ~ ~ run return run function iris:raycast/loop
execute if data storage iris:data {NextCoordinateChange: "x"} if score $dx iris matches ..-1 positioned ~-1 ~ ~ run return run function iris:raycast/loop
execute if data storage iris:data {NextCoordinateChange: "y"} if score $dy iris matches 0.. positioned ~ ~1 ~ run return run function iris:raycast/loop
execute if data storage iris:data {NextCoordinateChange: "y"} if score $dy iris matches ..-1 positioned ~ ~-1 ~ run return run function iris:raycast/loop
execute if data storage iris:data {NextCoordinateChange: "z"} if score $dz iris matches 0.. positioned ~ ~ ~1 run return run function iris:raycast/loop
execute if data storage iris:data {NextCoordinateChange: "z"} if score $dz iris matches ..-1 positioned ~ ~ ~-1 run return run function iris:raycast/loop
execute if score $depth iris < $max_depth iris at @s run return run function iris:raycast/loop
