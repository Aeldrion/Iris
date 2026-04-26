#> iris:raycast/macro_functions/compute_endpoint_helper
#
# @within iris:raycast/macro_functions/compute_endpoint
# @input
#   sign
#       One of "+", "-"
#   trunc
#       The absolute value of the number truncated towards 0
#   dec
#       The decimal part, i.e. whatever is after the deciam

$data modify storage iris:data coordinate set value $(sign)$(trunc).$(dec)
