#> retina:get_hitbox/block/trapdoors
#
# @within retina:get_hitbox/block

# open=false
execute if block ~ ~ ~ #minecraft:trapdoors[half=bottom, open=false] run data modify storage retina:data Surfaces set value {Top: [[0, 187500, 0, 1000000, 187500, 1000000]], Bottom: [[0, 0, 0, 1000000, 0, 1000000]], West: [[0, 0, 0, 0, 187500, 1000000]], East: [[1000000, 0, 0, 1000000, 187500, 1000000]], North: [[0, 0, 0, 1000000, 187500, 0]], South: [[0, 0, 1000000, 1000000, 187500, 1000000]]}
execute if block ~ ~ ~ #minecraft:trapdoors[half=top, open=false] run data modify storage retina:data Surfaces set value {Top: [[0, 1000000, 0, 1000000, 1000000, 1000000]], Bottom: [[0, 812500, 0, 1000000, 812500, 1000000]], West: [[0, 812500, 0, 0, 1000000, 1000000]], East: [[1000000, 812500, 0, 1000000, 1000000, 1000000]], North: [[0, 812500, 0, 1000000, 1000000, 0]], South: [[0, 812500, 1000000, 1000000, 1000000, 1000000]]}

# open=true
execute if block ~ ~ ~ #minecraft:trapdoors[facing=east, open=true] run data modify storage retina:data Surfaces set value {Top: [[0, 1000000, 0, 187500, 1000000, 1000000]], Bottom: [[0, 0, 0, 187500, 0, 1000000]], West: [[0, 0, 0, 0, 1000000, 1000000]], East: [[187500, 0, 0, 187500, 1000000, 1000000]], North: [[0, 0, 0, 187500, 1000000, 0]], South: [[0, 0, 1000000, 187500, 1000000, 1000000]]}
execute if block ~ ~ ~ #minecraft:trapdoors[facing=west, open=true] run data modify storage retina:data Surfaces set value {Top: [[812500, 1000000, 0, 1000000, 1000000, 1000000]], Bottom: [[812500, 0, 0, 1000000, 0, 1000000]], West: [[812500, 0, 0, 812500, 1000000, 1000000]], East: [[1000000, 0, 0, 1000000, 1000000, 1000000]], North: [[812500, 0, 0, 1000000, 1000000, 0]], South: [[812500, 0, 1000000, 1000000, 1000000, 1000000]]}
execute if block ~ ~ ~ #minecraft:trapdoors[facing=south, open=true] run data modify storage retina:data Surfaces set value {Top: [[0, 1000000, 0, 1000000, 1000000, 187500]], Bottom: [[0, 0, 0, 1000000, 0, 187500]], West: [[0, 0, 0, 0, 1000000, 187500]], East: [[1000000, 0, 0, 1000000, 1000000, 187500]], North: [[0, 0, 0, 1000000, 1000000, 0]], South: [[0, 0, 187500, 1000000, 1000000, 187500]]}
execute if block ~ ~ ~ #minecraft:trapdoors[facing=north, open=true] run data modify storage retina:data Surfaces set value {Top: [[0, 1000000, 812500, 1000000, 1000000, 1000000]], Bottom: [[0, 0, 812500, 1000000, 0, 1000000]], West: [[0, 0, 812500, 0, 1000000, 1000000]], East: [[1000000, 0, 812500, 1000000, 1000000, 1000000]], North: [[0, 0, 812500, 1000000, 1000000, 812500]], South: [[0, 0, 1000000, 1000000, 1000000, 1000000]]}