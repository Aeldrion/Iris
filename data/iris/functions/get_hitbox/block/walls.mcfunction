#> iris:get_hitbox/block/walls
#
# @within iris:get_hitbox/block

data modify storage iris:data Surfaces set value {Top: [[250000, 1000000, 250000, 750000, 1000000, 750000]], Bottom: [[250000, 0, 250000, 750000, 0, 750000]], West: [[250000, 0, 250000, 250000, 1000000, 750000]], East: [[750000, 0, 250000, 750000, 1000000, 750000]], North: [[250000, 0, 250000, 750000, 1000000, 250000]], South: [[250000, 0, 750000, 750000, 1000000, 750000]]}

# Low

execute if block ~ ~ ~ #minecraft:walls[east=low] run data modify storage iris:data Surfaces.Top append value [750000, 875000, 312500, 1000000, 875000, 687500]
execute if block ~ ~ ~ #minecraft:walls[east=low] run data modify storage iris:data Surfaces.Bottom append value [750000, 0, 312500, 1000000, 0, 687500]
execute if block ~ ~ ~ #minecraft:walls[east=low] run data modify storage iris:data Surfaces.West append value [750000, 0, 312500, 750000, 875000, 687500]
execute if block ~ ~ ~ #minecraft:walls[east=low] run data modify storage iris:data Surfaces.East append value [1000000, 0, 312500, 1000000, 875000, 687500]
execute if block ~ ~ ~ #minecraft:walls[east=low] run data modify storage iris:data Surfaces.North append value [750000, 0, 312500, 1000000, 875000, 312500]
execute if block ~ ~ ~ #minecraft:walls[east=low] run data modify storage iris:data Surfaces.South append value [750000, 0, 687500, 1000000, 875000, 687500]

execute if block ~ ~ ~ #minecraft:walls[west=low] run data modify storage iris:data Surfaces.Top append value [0, 875000, 312500, 250000, 875000, 687500]
execute if block ~ ~ ~ #minecraft:walls[west=low] run data modify storage iris:data Surfaces.Bottom append value [0, 0, 312500, 250000, 0, 687500]
execute if block ~ ~ ~ #minecraft:walls[west=low] run data modify storage iris:data Surfaces.West append value [0, 0, 312500, 0, 875000, 687500]
execute if block ~ ~ ~ #minecraft:walls[west=low] run data modify storage iris:data Surfaces.East append value [250000, 0, 312500, 250000, 875000, 687500]
execute if block ~ ~ ~ #minecraft:walls[west=low] run data modify storage iris:data Surfaces.North append value [0, 0, 312500, 250000, 875000, 312500]
execute if block ~ ~ ~ #minecraft:walls[west=low] run data modify storage iris:data Surfaces.South append value [0, 0, 687500, 250000, 875000, 687500]

execute if block ~ ~ ~ #minecraft:walls[north=low] run data modify storage iris:data Surfaces.Top append value [312500, 875000, 0, 687500, 875000, 250000]
execute if block ~ ~ ~ #minecraft:walls[north=low] run data modify storage iris:data Surfaces.Bottom append value [312500, 0, 0, 687500, 0, 250000]
execute if block ~ ~ ~ #minecraft:walls[north=low] run data modify storage iris:data Surfaces.West append value [312500, 0, 0, 312500, 875000, 250000]
execute if block ~ ~ ~ #minecraft:walls[north=low] run data modify storage iris:data Surfaces.East append value [687500, 0, 0, 687500, 875000, 250000]
execute if block ~ ~ ~ #minecraft:walls[north=low] run data modify storage iris:data Surfaces.North append value [312500, 0, 0, 687500, 875000, 0]
execute if block ~ ~ ~ #minecraft:walls[north=low] run data modify storage iris:data Surfaces.South append value [312500, 0, 250000, 687500, 875000, 250000]

execute if block ~ ~ ~ #minecraft:walls[south=low] run data modify storage iris:data Surfaces.Top append value [312500, 875000, 750000, 687500, 875000, 1000000]
execute if block ~ ~ ~ #minecraft:walls[south=low] run data modify storage iris:data Surfaces.Bottom append value [312500, 0, 750000, 687500, 0, 1000000]
execute if block ~ ~ ~ #minecraft:walls[south=low] run data modify storage iris:data Surfaces.West append value [312500, 0, 750000, 312500, 875000, 1000000]
execute if block ~ ~ ~ #minecraft:walls[south=low] run data modify storage iris:data Surfaces.East append value [687500, 0, 750000, 687500, 875000, 1000000]
execute if block ~ ~ ~ #minecraft:walls[south=low] run data modify storage iris:data Surfaces.North append value [312500, 0, 750000, 687500, 875000, 750000]
execute if block ~ ~ ~ #minecraft:walls[south=low] run data modify storage iris:data Surfaces.South append value [312500, 0, 1000000, 687500, 875000, 1000000]

# Tall

execute if block ~ ~ ~ #minecraft:walls[east=tall] run data modify storage iris:data Surfaces.Top append value [750000, 1000000, 312500, 1000000, 1000000, 687500]
execute if block ~ ~ ~ #minecraft:walls[east=tall] run data modify storage iris:data Surfaces.Bottom append value [750000, 0, 312500, 1000000, 0, 687500]
execute if block ~ ~ ~ #minecraft:walls[east=tall] run data modify storage iris:data Surfaces.West append value [750000, 0, 312500, 750000, 1000000, 687500]
execute if block ~ ~ ~ #minecraft:walls[east=tall] run data modify storage iris:data Surfaces.East append value [1000000, 0, 312500, 1000000, 1000000, 687500]
execute if block ~ ~ ~ #minecraft:walls[east=tall] run data modify storage iris:data Surfaces.North append value [750000, 0, 312500, 1000000, 1000000, 312500]
execute if block ~ ~ ~ #minecraft:walls[east=tall] run data modify storage iris:data Surfaces.South append value [750000, 0, 687500, 1000000, 1000000, 687500]

execute if block ~ ~ ~ #minecraft:walls[west=tall] run data modify storage iris:data Surfaces.Top append value [0, 1000000, 312500, 250000, 1000000, 687500]
execute if block ~ ~ ~ #minecraft:walls[west=tall] run data modify storage iris:data Surfaces.Bottom append value [0, 0, 312500, 250000, 0, 687500]
execute if block ~ ~ ~ #minecraft:walls[west=tall] run data modify storage iris:data Surfaces.West append value [0, 0, 312500, 0, 1000000, 687500]
execute if block ~ ~ ~ #minecraft:walls[west=tall] run data modify storage iris:data Surfaces.East append value [250000, 0, 312500, 250000, 1000000, 687500]
execute if block ~ ~ ~ #minecraft:walls[west=tall] run data modify storage iris:data Surfaces.North append value [0, 0, 312500, 250000, 1000000, 312500]
execute if block ~ ~ ~ #minecraft:walls[west=tall] run data modify storage iris:data Surfaces.South append value [0, 0, 687500, 250000, 1000000, 687500]

execute if block ~ ~ ~ #minecraft:walls[north=tall] run data modify storage iris:data Surfaces.Top append value [312500, 1000000, 0, 687500, 1000000, 250000]
execute if block ~ ~ ~ #minecraft:walls[north=tall] run data modify storage iris:data Surfaces.Bottom append value [312500, 0, 0, 687500, 0, 250000]
execute if block ~ ~ ~ #minecraft:walls[north=tall] run data modify storage iris:data Surfaces.West append value [312500, 0, 0, 312500, 1000000, 250000]
execute if block ~ ~ ~ #minecraft:walls[north=tall] run data modify storage iris:data Surfaces.East append value [687500, 0, 0, 687500, 1000000, 250000]
execute if block ~ ~ ~ #minecraft:walls[north=tall] run data modify storage iris:data Surfaces.North append value [312500, 0, 0, 687500, 1000000, 0]
execute if block ~ ~ ~ #minecraft:walls[north=tall] run data modify storage iris:data Surfaces.South append value [312500, 0, 250000, 687500, 1000000, 250000]

execute if block ~ ~ ~ #minecraft:walls[south=tall] run data modify storage iris:data Surfaces.Top append value [312500, 1000000, 750000, 687500, 1000000, 1000000]
execute if block ~ ~ ~ #minecraft:walls[south=tall] run data modify storage iris:data Surfaces.Bottom append value [312500, 0, 750000, 687500, 0, 1000000]
execute if block ~ ~ ~ #minecraft:walls[south=tall] run data modify storage iris:data Surfaces.West append value [312500, 0, 750000, 312500, 1000000, 1000000]
execute if block ~ ~ ~ #minecraft:walls[south=tall] run data modify storage iris:data Surfaces.East append value [687500, 0, 750000, 687500, 1000000, 1000000]
execute if block ~ ~ ~ #minecraft:walls[south=tall] run data modify storage iris:data Surfaces.North append value [312500, 0, 750000, 687500, 1000000, 750000]
execute if block ~ ~ ~ #minecraft:walls[south=tall] run data modify storage iris:data Surfaces.South append value [312500, 0, 1000000, 687500, 1000000, 1000000]