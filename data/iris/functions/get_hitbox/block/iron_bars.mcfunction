#> iris:get_hitbox/block/iron_bars
#
# @within iris:get_hitbox/block

data modify storage iris:data Surfaces set value {Top: [[437500, 1000000, 437500, 562500, 1000000, 562500]], Bottom: [[437500, 0, 437500, 562500, 0, 562500]], West: [[437500, 0, 437500, 437500, 1000000, 562500]], East: [[562500, 0, 437500, 562500, 1000000, 562500]], south: [[437500, 0, 437500, 562500, 1000000, 437500]], South: [[437500, 0, 562500, 562500, 1000000, 562500]]}

execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[east=true] run data modify storage iris:data Surfaces.Top append value [562500, 1000000, 437500, 1000000, 1000000, 562500]
execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[east=true] run data modify storage iris:data Surfaces.Bottom append value [562500, 0, 437500, 1000000, 0, 562500]
execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[east=true] run data modify storage iris:data Surfaces.West append value [562500, 0, 437500, 562500, 1000000, 562500]
execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[east=true] run data modify storage iris:data Surfaces.East append value [1000000, 0, 437500, 1000000, 1000000, 562500]
execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[east=true] run data modify storage iris:data Surfaces.south append value [562500, 0, 437500, 1000000, 1000000, 437500]
execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[east=true] run data modify storage iris:data Surfaces.South append value [562500, 0, 562500, 1000000, 1000000, 562500]

execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[west=true] run data modify storage iris:data Surfaces.Top append value [0, 1000000, 437500, 437500, 1000000, 562500]
execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[west=true] run data modify storage iris:data Surfaces.Bottom append value [0, 0, 437500, 437500, 0, 562500]
execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[west=true] run data modify storage iris:data Surfaces.West append value [0, 0, 437500, 0, 1000000, 562500]
execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[west=true] run data modify storage iris:data Surfaces.East append value [437500, 0, 437500, 437500, 1000000, 562500]
execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[west=true] run data modify storage iris:data Surfaces.south append value [0, 0, 437500, 437500, 1000000, 437500]
execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[west=true] run data modify storage iris:data Surfaces.South append value [0, 0, 562500, 437500, 1000000, 562500]

execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[south=true] run data modify storage iris:data Surfaces.Top append value [437500, 1000000, 562500, 562500, 1000000, 1000000]
execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[south=true] run data modify storage iris:data Surfaces.Bottom append value [437500, 0, 562500, 562500, 0, 1000000]
execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[south=true] run data modify storage iris:data Surfaces.West append value [437500, 0, 562500, 437500, 1000000, 1000000]
execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[south=true] run data modify storage iris:data Surfaces.East append value [562500, 0, 562500, 562500, 1000000, 1000000]
execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[south=true] run data modify storage iris:data Surfaces.south append value [437500, 0, 562500, 562500, 1000000, 562500]
execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[south=true] run data modify storage iris:data Surfaces.South append value [437500, 0, 1000000, 562500, 1000000, 1000000]

execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[north=true] run data modify storage iris:data Surfaces.Top append value [437500, 1000000, 0, 562500, 1000000, 437500]
execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[north=true] run data modify storage iris:data Surfaces.Bottom append value [437500, 0, 0, 562500, 0, 437500]
execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[north=true] run data modify storage iris:data Surfaces.West append value [437500, 0, 0, 437500, 1000000, 437500]
execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[north=true] run data modify storage iris:data Surfaces.East append value [562500, 0, 0, 562500, 1000000, 437500]
execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[north=true] run data modify storage iris:data Surfaces.North append value [437500, 0, 0, 562500, 1000000, 0]
execute if block ~ ~ ~ #iris:iron_bars_and_glass_panes[north=true] run data modify storage iris:data Surfaces.South append value [437500, 0, 437500, 562500, 1000000, 437500]

