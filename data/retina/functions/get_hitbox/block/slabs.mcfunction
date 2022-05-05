#> retina:get_hitbox/block/slabs
#
# @within retina:get_hitbox/block

execute if block ~ ~ ~ #minecraft:slabs[type=bottom] run data modify storage retina:data Surfaces set value {Top: [[0, 500000, 0, 1000000, 500000, 1000000]], Bottom: [[0, 0, 0, 1000000, 0, 1000000]], West: [[0, 0, 0, 0, 500000, 1000000]], East: [[1000000, 0, 0, 1000000, 500000, 1000000]], North: [[0, 0, 0, 1000000, 500000, 0]], South: [[0, 0, 1000000, 1000000, 500000, 1000000]]}
execute if block ~ ~ ~ #minecraft:slabs[type=top] run data modify storage retina:data Surfaces set value {Top: [[0, 1000000, 0, 1000000, 1000000, 1000000]], Bottom: [[0, 500000, 0, 1000000, 500000, 1000000]], West: [[0, 500000, 0, 0, 1000000, 1000000]], East: [[1000000, 500000, 0, 1000000, 1000000, 1000000]], North: [[0, 500000, 0, 1000000, 1000000, 0]], South: [[0, 500000, 1000000, 1000000, 1000000, 1000000]]}
execute if block ~ ~ ~ #minecraft:slabs[type=double] run data modify storage retina:data Surfaces set value {Top: [[0, 1000000, 0, 1000000, 1000000, 1000000]], Bottom: [[0, 0, 0, 1000000, 0, 1000000]], West: [[0, 0, 0, 0, 1000000, 1000000]], East: [[1000000, 0, 0, 1000000, 1000000, 1000000]], North: [[0, 0, 0, 1000000, 1000000, 0]], South: [[0, 0, 1000000, 1000000, 1000000, 1000000]]}