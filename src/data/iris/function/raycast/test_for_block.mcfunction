#> iris:raycast/test_for_block
#
# @within iris:raycast/loop
# @output
#   Result: 0
#   Success: 1 if a block was hit, 0 otherwise

# Check if the current block is loaded
execute unless blocks ~ ~ ~ ~ ~ ~ ~ ~ ~ masked run return fail

# Check if the current block is blacklisted, or explicitly not whitelisted
execute if data storage iris:settings whitelist run data modify storage iris:args id set from storage iris:settings whitelist
execute if data storage iris:settings whitelist store success score $is_whitelisted iris run function iris:raycast/macro_functions/block_id_test with storage iris:args
execute if data storage iris:settings whitelist unless score $is_whitelisted iris matches 1 run return fail
execute if data storage iris:settings blacklist run data modify storage iris:args id set from storage iris:settings blacklist
execute if data storage iris:settings blacklist store success score $is_blacklisted iris run function iris:raycast/macro_functions/block_id_test with storage iris:args
execute if data storage iris:settings blacklist if score $is_blacklisted iris matches 1 run return fail

# See if the block is hit
function iris:get_hitbox/block
execute unless data storage iris:data shape[0] run return fail
return run function iris:raycast/check_intersection/ray_shape
