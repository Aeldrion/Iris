#> iris:raycast/macro_functions/block_id_test
#
# @input
#   id: A block ID or block tag ID
# @output
#   Success/Result: 1 if the current block is the provided ID, 0 otherwise
# @within iris:raycast/test_for_block

$return run execute if block ~ ~ ~ $(id)