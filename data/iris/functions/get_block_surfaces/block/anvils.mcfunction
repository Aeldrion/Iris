#> iris:get_block_surfaces/block/anvils
#
# @within iris:get_block_surfaces/main

data modify storage iris:block Surfaces set value {Top: [[125000, 250000, 125000, 875000, 250000, 875000]], Bottom: [[125000, 0, 125000, 875000, 0, 875000]], West: [[125000, 0, 125000, 125000, 250000, 875000]], East: [[875000, 0, 125000, 875000, 250000, 875000]], North: [[125000, 0, 125000, 875000, 250000, 125000]], South: [[125000, 0, 875000, 875000, 250000, 875000]]}

# East or West
execute unless block ~ ~ ~ #minecraft:anvil[facing=north] unless block ~ ~ ~ #minecraft:anvil[facing=south] run data modify storage iris:block Surfaces.Top append value [187500, 312500, 250000, 812500, 312500, 750000]
execute unless block ~ ~ ~ #minecraft:anvil[facing=north] unless block ~ ~ ~ #minecraft:anvil[facing=south] run data modify storage iris:block Surfaces.Bottom append value [187500, 250000, 250000, 812500, 250000, 750000]
execute unless block ~ ~ ~ #minecraft:anvil[facing=north] unless block ~ ~ ~ #minecraft:anvil[facing=south] run data modify storage iris:block Surfaces.West append value [187500, 250000, 250000, 187500, 312500, 750000]
execute unless block ~ ~ ~ #minecraft:anvil[facing=north] unless block ~ ~ ~ #minecraft:anvil[facing=south] run data modify storage iris:block Surfaces.East append value [812500, 250000, 250000, 812500, 312500, 750000]
execute unless block ~ ~ ~ #minecraft:anvil[facing=north] unless block ~ ~ ~ #minecraft:anvil[facing=south] run data modify storage iris:block Surfaces.North append value [187500, 250000, 250000, 812500, 312500, 250000]
execute unless block ~ ~ ~ #minecraft:anvil[facing=north] unless block ~ ~ ~ #minecraft:anvil[facing=south] run data modify storage iris:block Surfaces.South append value [187500, 250000, 750000, 812500, 312500, 750000]

# North or South
execute unless block ~ ~ ~ #minecraft:anvil[facing=east] unless block ~ ~ ~ #minecraft:anvil[facing=west] run data modify storage iris:block Surfaces.Top append value [250000, 312500, 187500, 750000, 312500, 812500]
execute unless block ~ ~ ~ #minecraft:anvil[facing=east] unless block ~ ~ ~ #minecraft:anvil[facing=west] run data modify storage iris:block Surfaces.Bottom append value [250000, 250000, 187500, 750000, 250000, 812500]
execute unless block ~ ~ ~ #minecraft:anvil[facing=east] unless block ~ ~ ~ #minecraft:anvil[facing=west] run data modify storage iris:block Surfaces.West append value [250000, 250000, 187500, 250000, 312500, 812500]
execute unless block ~ ~ ~ #minecraft:anvil[facing=east] unless block ~ ~ ~ #minecraft:anvil[facing=west] run data modify storage iris:block Surfaces.East append value [750000, 250000, 187500, 750000, 312500, 812500]
execute unless block ~ ~ ~ #minecraft:anvil[facing=east] unless block ~ ~ ~ #minecraft:anvil[facing=west] run data modify storage iris:block Surfaces.North append value [250000, 250000, 187500, 750000, 312500, 187500]
execute unless block ~ ~ ~ #minecraft:anvil[facing=east] unless block ~ ~ ~ #minecraft:anvil[facing=west] run data modify storage iris:block Surfaces.South append value [250000, 250000, 812500, 750000, 312500, 812500]