#> iris:get_position/teleport
#
# Teleports the executing entity to the current position plus a vector
#
# @context any entity
# @within iris:get_position/get_coordinates
# @input
#   x, y, z: Target position relative to the current position

$teleport @s ~$(x) ~$(y) ~$(z)
