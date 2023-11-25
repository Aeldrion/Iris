#> iris:raycast/test_for_block
#
# @output
#   Result: 0
#   Success: 1 if a block was hit, 0 otherwise

execute store success score $loaded iris if blocks ~ ~ ~ ~ ~ ~ ~ ~ ~ masked
execute if score $loaded iris matches 0 run return fail
execute if block ~ ~ ~ #iris:air run return fail

function iris:get_hitbox/block
return run function iris:raycast/check_intersection/loop
