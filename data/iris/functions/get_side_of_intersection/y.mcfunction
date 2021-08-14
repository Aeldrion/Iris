#> iris:get_side_of_intersection/y
#
# Calculates how much more the ray needs to progress before reaching a block with a different Y position
#
# @within iris:get_side_of_intersection/main
# @output
#	score $distance_to_next_block_on_y_axis
#		A number between 0 and 1,000,000,000. 1000 corresponds to one block.

execute if score $dy iris matches 0.. run scoreboard players set $distance_to_next_block_on_y_axis iris 1000000000
execute if score $dy iris matches ..-1 run scoreboard players set $distance_to_next_block_on_y_axis iris 0

scoreboard players operation ${y}*1000 iris = ${y} iris
scoreboard players operation ${y}*1000 iris *= $1000 iris
scoreboard players operation $distance_to_next_block_on_y_axis iris -= ${y}*1000 iris
scoreboard players operation $distance_to_next_block_on_y_axis iris /= $dy iris

scoreboard players reset ${y}*1000 iris