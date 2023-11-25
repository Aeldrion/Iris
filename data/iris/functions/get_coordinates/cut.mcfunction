#> iris:get_coordinates/cut
#
# Pads iris:args string with extra 0s and then cuts the first six characters

$data modify storage iris:args string set value "$(string)000000"
data modify storage iris:args string set string storage iris:args string 0 6
