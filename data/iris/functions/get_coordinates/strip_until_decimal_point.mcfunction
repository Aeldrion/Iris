data modify storage iris:data Character set string storage iris:data String 0 1
data modify storage iris:data String set string storage iris:data String 1 -1
execute if data storage iris:data {Character: '.'} run return 0
function iris:get_coordinates/strip_until_decimal_point
