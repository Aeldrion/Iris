#> iris:raycast/test_for_block
#
# @output
#   Result: 0
#   Success: 1 if a block was hit, 0 otherwise

# Check if the current block is loaded
execute store success score $loaded iris if blocks ~ ~ ~ ~ ~ ~ ~ ~ ~ masked
execute if score $loaded iris matches 0 run return fail

# Check if the current block is blacklisted, or explicitly not whitelisted
execute if data storage iris:settings Whitelist run data modify storage iris:args id set from storage iris:settings Whitelist
execute if data storage iris:settings Whitelist store success score $is_whitelisted iris run function iris:raycast/macro_functions/block_id_test with storage iris:args
execute if data storage iris:settings Whitelist unless score $is_whitelisted iris matches 1 run return fail
execute if data storage iris:settings Blacklist run data modify storage iris:args id set from storage iris:settings Blacklist
execute if data storage iris:settings Blacklist store success score $is_blacklisted iris run function iris:raycast/macro_functions/block_id_test with storage iris:args
execute if data storage iris:settings Blacklist if score $is_blacklisted iris matches 1 run return fail

# See if the block is hit
function iris:get_hitbox/block
execute unless data storage iris:data Shape[0] run return fail
return run function iris:raycast/check_intersection/loop
