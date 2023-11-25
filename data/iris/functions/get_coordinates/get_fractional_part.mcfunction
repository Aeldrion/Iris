#> iris:get_coordinates/get_fractional_part
#
# Gets the fractional coordinate of a float or double saved as a string, with the 'f' or 'd' removed

# See if the number is negative
data modify storage iris:data Character set string storage iris:data String 0 1
execute store success score $is_negative iris if data storage iris:data {Character: '-'}

# Remove all characters up until the "."
function iris:get_coordinates/strip_until_decimal_point
data modify storage iris:args string set from storage iris:data String

# Pad with six extra 0's in case the string is not long enough, cut the first six characters, and read it as an int
function iris:get_coordinates/cut with storage iris:args
execute store result score $fractional_part iris run function iris:get_coordinates/string_to_int with storage iris:args

# If the number was negative, take the complement to 1000000, unless the fractional part is 0
execute unless score $is_negative iris matches 1 run return run scoreboard players get $fractional_part iris
execute if score $fractional_part iris matches 0 run return 0
scoreboard players operation $fractional_part iris *= $-1 iris
scoreboard players add $fractional_part iris 1000000
return run scoreboard players get $fractional_part iris
