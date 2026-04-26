#> iris:get_hitbox/macro_functions/compute_endpoint
#
# Takes a decomposition of a coordinate as an integer part and a fractional part and computes the corresponding number as an NBT float
#
# @within iris:raycast/on_hit
# @reads
#   score $[x] iris
#       The integer part of the X coordinate
#   score ${x} iris
#       The fractional part of the X coordinate
# @input
#   axis
#       One of "x", "y", "z"; wh

# Store integer part and fractional part, and store sign
$scoreboard players operation $integer_part iris = $[$(axis)] iris
$scoreboard players operation $fractional_part iris = ${$(axis)} iris
execute if score $integer_part iris matches 0.. run data modify storage iris:args sign set value "+"
execute if score $integer_part iris matches ..-1 run data modify storage iris:args sign set value "-"
execute if score $fractional_part iris matches 1000000 run scoreboard players add $integer_part iris 1
execute if score $fractional_part iris matches 1000000 run scoreboard players set $fractional_part iris 0

# Compute truncated part (abs(trunc(x)))
scoreboard players operation $trunc iris = $integer_part iris
execute if data storage iris:args {sign: "-"} run scoreboard players operation $trunc iris *= $-1 iris
execute if data storage iris:args {sign: "-"} if score $fractional_part iris matches 1.. run scoreboard players remove $trunc iris 1
execute store result storage iris:args trunc int 1 run scoreboard players get $trunc iris

# Compute decimal part (whatever is after the ., e.g. 705216 in -3.705216)
execute if data storage iris:args {sign: "+"} run scoreboard players operation $dec iris = $fractional_part iris
execute if data storage iris:args {sign: "-"} if score $fractional_part iris matches 0 run scoreboard players set $dec iris 0
execute if data storage iris:args {sign: "-"} if score $fractional_part iris matches 1.. run scoreboard players set $dec iris 1000000
execute if data storage iris:args {sign: "-"} if score $fractional_part iris matches 1.. run scoreboard players operation $dec iris -= $fractional_part iris
execute store result storage iris:args value int 1 run scoreboard players get $dec iris
function iris:raycast/macro_functions/pad_with_zeros with storage iris:args
data modify storage iris:args dec set from storage iris:data string

# Combine everything
function iris:raycast/macro_functions/compute_endpoint_helper with storage iris:args
