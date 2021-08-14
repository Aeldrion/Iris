#> iris:get_block_surfaces/block/fences
#
# @within iris:get_block_surfaces/main

data modify storage iris:block Surfaces set value {Top: [[375000, 1000000, 375000, 625000, 1000000, 625000]], Bottom: [[375000, 0, 375000, 625000, 0, 625000]], West: [[375000, 0, 375000, 375000, 1000000, 625000]], East: [[625000, 0, 375000, 625000, 1000000, 625000]], North: [[375000, 0, 375000, 625000, 1000000, 375000]], South: [[375000, 0, 625000, 625000, 1000000, 625000]]}

execute if block ~ ~ ~ #minecraft:fences[east=true] run data modify storage iris:block Surfaces.Top append value [625000, 1000000, 375000, 1000000, 1000000, 625000]
execute if block ~ ~ ~ #minecraft:fences[east=true] run data modify storage iris:block Surfaces.Bottom append value [625000, 0, 375000, 1000000, 0, 625000]
execute if block ~ ~ ~ #minecraft:fences[east=true] run data modify storage iris:block Surfaces.West append value [625000, 0, 375000, 625000, 1000000, 625000]
execute if block ~ ~ ~ #minecraft:fences[east=true] run data modify storage iris:block Surfaces.East append value [1000000, 0, 375000, 1000000, 1000000, 625000]
execute if block ~ ~ ~ #minecraft:fences[east=true] run data modify storage iris:block Surfaces.North append value [625000, 0, 375000, 1000000, 1000000, 375000]
execute if block ~ ~ ~ #minecraft:fences[east=true] run data modify storage iris:block Surfaces.South append value [625000, 0, 625000, 1000000, 1000000, 625000]

execute if block ~ ~ ~ #minecraft:fences[west=true] run data modify storage iris:block Surfaces.Top append value [0, 1000000, 375000, 375000, 1000000, 625000]
execute if block ~ ~ ~ #minecraft:fences[west=true] run data modify storage iris:block Surfaces.Bottom append value [0, 0, 375000, 375000, 0, 625000]
execute if block ~ ~ ~ #minecraft:fences[west=true] run data modify storage iris:block Surfaces.West append value [0, 0, 375000, 0, 1000000, 625000]
execute if block ~ ~ ~ #minecraft:fences[west=true] run data modify storage iris:block Surfaces.East append value [375000, 0, 375000, 375000, 1000000, 625000]
execute if block ~ ~ ~ #minecraft:fences[west=true] run data modify storage iris:block Surfaces.North append value [0, 0, 375000, 375000, 1000000, 375000]
execute if block ~ ~ ~ #minecraft:fences[west=true] run data modify storage iris:block Surfaces.South append value [0, 0, 625000, 375000, 1000000, 625000]

execute if block ~ ~ ~ #minecraft:fences[south=true] run data modify storage iris:block Surfaces.Top append value [375000, 1000000, 625000, 625000, 1000000, 1000000]
execute if block ~ ~ ~ #minecraft:fences[south=true] run data modify storage iris:block Surfaces.Bottom append value [375000, 0, 625000, 625000, 0, 1000000]
execute if block ~ ~ ~ #minecraft:fences[south=true] run data modify storage iris:block Surfaces.West append value [375000, 0, 625000, 375000, 1000000, 1000000]
execute if block ~ ~ ~ #minecraft:fences[south=true] run data modify storage iris:block Surfaces.East append value [625000, 0, 625000, 625000, 1000000, 1000000]
execute if block ~ ~ ~ #minecraft:fences[south=true] run data modify storage iris:block Surfaces.North append value [375000, 0, 625000, 625000, 1000000, 625000]
execute if block ~ ~ ~ #minecraft:fences[south=true] run data modify storage iris:block Surfaces.South append value [375000, 0, 1000000, 625000, 1000000, 1000000]

execute if block ~ ~ ~ #minecraft:fences[north=true] run data modify storage iris:block Surfaces.Top append value [375000, 1000000, 0, 625000, 1000000, 375000]
execute if block ~ ~ ~ #minecraft:fences[north=true] run data modify storage iris:block Surfaces.Bottom append value [375000, 0, 0, 625000, 0, 375000]
execute if block ~ ~ ~ #minecraft:fences[north=true] run data modify storage iris:block Surfaces.West append value [375000, 0, 0, 375000, 1000000, 375000]
execute if block ~ ~ ~ #minecraft:fences[north=true] run data modify storage iris:block Surfaces.East append value [625000, 0, 0, 625000, 1000000, 375000]
execute if block ~ ~ ~ #minecraft:fences[north=true] run data modify storage iris:block Surfaces.North append value [375000, 0, 0, 625000, 1000000, 0]
execute if block ~ ~ ~ #minecraft:fences[north=true] run data modify storage iris:block Surfaces.South append value [375000, 0, 375000, 625000, 1000000, 375000]