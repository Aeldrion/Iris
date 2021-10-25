#> iris:get_hitbox/block/anvils
#
# @within iris:get_hitbox/block

data modify storage iris:data Surfaces set value {Top: [[125000, 250000, 125000, 875000, 250000, 875000]], Bottom: [[125000, 0, 125000, 875000, 0, 875000]], West: [[125000, 0, 125000, 125000, 250000, 875000]], East: [[875000, 0, 125000, 875000, 250000, 875000]], North: [[125000, 0, 125000, 875000, 250000, 125000]], South: [[125000, 0, 875000, 875000, 250000, 875000]]}

# East or West
execute unless block ~ ~ ~ #minecraft:anvil[facing=north] unless block ~ ~ ~ #minecraft:anvil[facing=south] run data modify storage iris:data NewSurfaces.Top set value [[187500, 312500, 250000, 812500, 312500, 750000], [250000, 625000, 375000, 750000, 625000, 625000], [0, 1000000, 187500, 1000000, 1000000, 812500]]
execute unless block ~ ~ ~ #minecraft:anvil[facing=north] unless block ~ ~ ~ #minecraft:anvil[facing=south] run data modify storage iris:data NewSurfaces.Bottom set value [[187500, 250000, 250000, 812500, 250000, 750000], [250000, 312500, 375000, 750000, 312500, 625000], [0, 625000, 187500, 1000000, 625000, 812500]]
execute unless block ~ ~ ~ #minecraft:anvil[facing=north] unless block ~ ~ ~ #minecraft:anvil[facing=south] run data modify storage iris:data NewSurfaces.West set value [[187500, 250000, 250000, 187500, 312500, 750000], [250000, 312500, 375000, 250000, 625000, 625000], [0, 625000, 187500, 0, 1000000, 812500]]
execute unless block ~ ~ ~ #minecraft:anvil[facing=north] unless block ~ ~ ~ #minecraft:anvil[facing=south] run data modify storage iris:data NewSurfaces.East set value [[812500, 250000, 250000, 812500, 312500, 750000], [750000, 312500, 375000, 750000, 625000, 625000], [1000000, 625000, 187500, 1000000, 1000000, 812500]]
execute unless block ~ ~ ~ #minecraft:anvil[facing=north] unless block ~ ~ ~ #minecraft:anvil[facing=south] run data modify storage iris:data NewSurfaces.North set value [[187500, 250000, 250000, 812500, 312500, 250000], [250000, 312500, 375000, 750000, 625000, 375000], [0, 625000, 187500, 1000000, 1000000, 187500]]
execute unless block ~ ~ ~ #minecraft:anvil[facing=north] unless block ~ ~ ~ #minecraft:anvil[facing=south] run data modify storage iris:data NewSurfaces.South set value [[187500, 250000, 750000, 812500, 312500, 750000], [250000, 312500, 625000, 750000, 625000, 625000], [0, 625000, 812500, 1000000, 1000000, 812500]]

# North or South
execute unless block ~ ~ ~ #minecraft:anvil[facing=east] unless block ~ ~ ~ #minecraft:anvil[facing=west] run data modify storage iris:data NewSurfaces.Top set value [[250000, 312500, 187500, 750000, 312500, 812500], [375000, 625000, 250000, 625000, 625000, 750000], [187500, 1000000, 0, 812500, 1000000, 1000000]]
execute unless block ~ ~ ~ #minecraft:anvil[facing=east] unless block ~ ~ ~ #minecraft:anvil[facing=west] run data modify storage iris:data NewSurfaces.Bottom set value [[250000, 250000, 187500, 750000, 250000, 812500], [375000, 312500, 250000, 625000, 312500, 750000], [187500, 625000, 0, 812500, 625000, 1000000]]
execute unless block ~ ~ ~ #minecraft:anvil[facing=east] unless block ~ ~ ~ #minecraft:anvil[facing=west] run data modify storage iris:data NewSurfaces.West set value [[250000, 250000, 187500, 250000, 312500, 812500], [375000, 312500, 250000, 375000, 625000, 750000], [187500, 625000, 0, 187500, 1000000, 1000000]]
execute unless block ~ ~ ~ #minecraft:anvil[facing=east] unless block ~ ~ ~ #minecraft:anvil[facing=west] run data modify storage iris:data NewSurfaces.East set value [[750000, 250000, 187500, 750000, 312500, 812500], [625000, 312500, 250000, 625000, 625000, 750000], [812500, 625000, 0, 812500, 1000000, 1000000]]
execute unless block ~ ~ ~ #minecraft:anvil[facing=east] unless block ~ ~ ~ #minecraft:anvil[facing=west] run data modify storage iris:data NewSurfaces.North set value [[250000, 250000, 187500, 750000, 312500, 187500], [375000, 312500, 250000, 625000, 625000, 250000], [187500, 625000, 0, 812500, 1000000, 0]]
execute unless block ~ ~ ~ #minecraft:anvil[facing=east] unless block ~ ~ ~ #minecraft:anvil[facing=west] run data modify storage iris:data NewSurfaces.South set value [[250000, 250000, 812500, 750000, 312500, 812500], [375000, 312500, 750000, 625000, 625000, 750000], [187500, 625000, 1000000, 812500, 1000000, 1000000]]

# Add to iris:data (using another storage is needed here as you cannot append several values to a list directly)
data modify storage iris:data Surfaces.Top append from storage iris:data NewSurfaces.Top[]
data modify storage iris:data Surfaces.Bottom append from storage iris:data NewSurfaces.Bottom[]
data modify storage iris:data Surfaces.West append from storage iris:data NewSurfaces.West[]
data modify storage iris:data Surfaces.East append from storage iris:data NewSurfaces.East[]
data modify storage iris:data Surfaces.North append from storage iris:data NewSurfaces.North[]
data modify storage iris:data Surfaces.South append from storage iris:data NewSurfaces.South[]