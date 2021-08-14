#> iris:get_side_of_intersection/x
#
# Calculates how much more the ray needs to progress before reaching a block with a different X position
#
# @within iris:get_side_of_intersection/main
# @output
#	score $distance_to_next_block_on_x_axis
#		A number between 0 and 1,000,000,000. 1000 corresponds to one block.

execute if score $dx iris matches 0.. run scoreboard players set $distance_to_next_block_on_x_axis iris 1000000000
execute if score $dx iris matches ..-1 run scoreboard players set $distance_to_next_block_on_x_axis iris 0

scoreboard players operation ${x}*1000 iris = ${x} iris
scoreboard players operation ${x}*1000 iris *= $1000 iris
scoreboard players operation $distance_to_next_block_on_x_axis iris -= ${x}*1000 iris
scoreboard players operation $distance_to_next_block_on_x_axis iris /= $dx iris

scoreboard players reset ${x}*1000 iris