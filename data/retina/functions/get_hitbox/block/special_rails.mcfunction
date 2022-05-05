#> retina:get_hitbox/block/special_rails
#
# @within retina:get_hitbox/block

execute unless block ~ ~ ~ #retina:special_rails[shape=ascending_east] unless block ~ ~ ~ #retina:special_rails[shape=ascending_west] unless block ~ ~ ~ #retina:special_rails[shape=ascending_north] unless block ~ ~ ~ #retina:special_rails[shape=ascending_south] run data modify storage retina:data Surfaces set value {Top: [[0, 125000, 0, 1000000, 125000, 1000000]], Bottom: [[0, 0, 0, 1000000, 0, 1000000]], West: [[0, 0, 0, 0, 125000, 1000000]], East: [[1000000, 0, 0, 1000000, 125000, 1000000]], North: [[0, 0, 0, 1000000, 125000, 0]], South: [[0, 0, 1000000, 1000000, 125000, 1000000]]}
execute unless block ~ ~ ~ #retina:special_rails[shape=east_west] unless block ~ ~ ~ #retina:special_rails[shape=north_south] run data modify storage retina:data Surfaces set value {Top: [[0, 500000, 0, 1000000, 500000, 1000000]], Bottom: [[0, 0, 0, 1000000, 0, 1000000]], West: [[0, 0, 0, 0, 500000, 1000000]], East: [[1000000, 0, 0, 1000000, 500000, 1000000]], North: [[0, 0, 0, 1000000, 500000, 0]], South: [[0, 0, 1000000, 1000000, 500000, 1000000]]}