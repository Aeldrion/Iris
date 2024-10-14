#> iris:get_position/teleport
#
# Teleports the executing entity to a position given by integer and fractional coordinates
#
# @context any entity
# @within iris:get_position/get_coordinates
# @input
#   x, y, z: The integer part (rounding near -inf) of the target coordinates
#   dx, dy, dz: The fractional part of the target coordinates, in millionths of a block (must include leading zeros, e.g. 027319 or 463205 or 000000)

$teleport @s $(x).0 $(y).0 $(z).0
$execute at @s run teleport @s ~0.$(dx) ~0.$(dy) ~0.$(dz)
