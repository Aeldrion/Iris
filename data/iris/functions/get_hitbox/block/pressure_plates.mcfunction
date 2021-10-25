#> iris:get_hitbox/block/pressure_plates
#
# @within iris:get_hitbox/block

execute if block ~ ~ ~ #minecraft:pressure_plates[powered=false] run data modify storage iris:data Surfaces set value {Top: [[62500, 62500, 62500, 937500, 62500, 937500]], Bottom: [[62500, 0, 62500, 937500, 0, 937500]], West: [[62500, 0, 62500, 62500, 62500, 937500]], East: [[937500, 0, 62500, 937500, 62500, 937500]], North: [[62500, 0, 62500, 937500, 62500, 62500]], South: [[62500, 0, 937500, 937500, 62500, 937500]]}
execute if block ~ ~ ~ #minecraft:pressure_plates[powered=true] run data modify storage iris:data Surfaces set value {Top: [[62500, 31250, 62500, 937500, 31250, 937500]], Bottom: [[62500, 0, 62500, 937500, 0, 937500]], West: [[62500, 0, 62500, 62500, 31250, 937500]], East: [[937500, 0, 62500, 937500, 31250, 937500]], North: [[62500, 0, 62500, 937500, 31250, 62500]], South: [[62500, 0, 937500, 937500, 31250, 937500]]}