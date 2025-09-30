#> iris:set_coordinates/pad_with_zeros
#
# Adds six leading zeros in front of the input string
#
# Rationale: in iris:set_coordinates/teleport, there is a teleport command which uses numbers as macro arguments behind the decimal place, i.e.
#       teleport @s ~0.$(dx) ~0.$(dy) ~0.$(dz)
# where $(dx), $(dy), $(dz) is assumed to be between 0 and 999999. Whenever one of these figures is less than 100000, the entity is teleport further away than intended.
# For example, if $(dx) is "3", then the entity is teleported 0.3 blocks away on the x axis instead of 0.000003 blocks away.
# To avoid this issue, we pad the input value with six leading zeros, and we then preserve only the six last characters:
#   3       -> 0000003      -> 000003 -> tp @s ~0.000003 ...
#   586     -> 000000586    -> 000586 -> tp @s ~0.000586 ...
#   724955  -> 000000724955 -> 724955 -> tp @s ~0.724955 ...
#
# @within iris:set_coordinates/main
# @input
#   value
#       A numeric value between 0 and 999999
# @writes
#   storage iris:data String
#       The resulting string

$data modify storage iris:data String set value "000000$(value)"
