#> iris:raycast/macro_functions/pad_with_zeros
#
# Adds six leading zeros in front of the input string, then only keep the last six characters
#
# Rationale: in compute_endpoint_aux, we combine two numbers into one single number with a macro function:
#       $(sign)$(trunc).$(dec)
# where sign is "+" or "-", trunc is the absolute value of the number truncated towards 0, and dec is the decimal part
# If dec is less than 100000, then we need to add extra zeros in front, because 0.000003 is different than 0.3 for example:
#       716085  -> 000000716085 -> 716085
#         5916  -> 0000005916   -> 005916
#            3  -> 0000003      -> 000003
#
# @within iris:raycast/macro_functions/compute_endpoint
# @input
#   value
#       A numeric value between 0 and 999999
# @writes
#   storage iris:data string
#       The resulting string

$data modify storage iris:data string set value "000000$(value)"
data modify storage iris:data string set string storage iris:data string -6
