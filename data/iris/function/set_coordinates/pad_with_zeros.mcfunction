#> iris:set_coordinates/pad_with_zeros
#
# Adds six leading zeros in front of the input string
# Rationale: for ${x} less than 100000, using the input as is in the fractional part of the corresponding relative coordinate in the teleport command sends the entity too far away (for example for ${x} = 3, we want to teleport to ~0.000003, not ~0.3)
# To avoid this issue, we pad the input value with six leading zeros, and we then cut the last six digits: 3 -> 0000003 -> tp @s ~0.000003 ...
#
# @input
#   value
#       A numeric value between 0 and 999999
# @writes
#   storage iris:data String
#       The resulting string

$data modify storage iris:data String set value "000000$(value)"
