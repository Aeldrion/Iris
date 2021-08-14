#> iris:get_side_of_intersection/z
#
# Calculates how much more the ray needs to progress before reaching a block with a different Z position
#
# @within iris:get_side_of_intersection/main
# @output
#	score $distance_to_next_block_on_z_axis
#		A number between 0 and 1,000,000,000. 1000 corresponds to one block.

execute if score $dz iris matches 0.. run scoreboard players set $distance_to_next_block_on_z_axis iris 1000000000
execute if score $dz iris matches ..-1 run scoreboard players set $distance_to_next_block_on_z_axis iris 0

scoreboard players operation ${z}*1000 iris = ${z} iris
scoreboard players operation ${z}*1000 iris *= $1000 iris
scoreboard players operation $distance_to_next_block_on_z_axis iris -= ${z}*1000 iris
scoreboard players operation $distance_to_next_block_on_z_axis iris /= $dz iris

scoreboard players reset ${z}*1000 iris