# This function gets the fractional part of the x coordinate, executed as an area effect cloud by iris:get_coordinates/as_marker_entity
# Due to overflows, storing with a high scale was not possible. This method compares the executing position - aligned to the block grid - to the executing entity

execute store success score $get_coordinates.within_524288 iris if entity @s[distance=..0.524288]

execute if score $get_coordinates.within_524288 iris matches 0 run scoreboard players add ${x} iris 524288
execute if score $get_coordinates.within_524288 iris matches 0 positioned ~0.524288 ~ ~ run function iris:get_coordinates/x/1
execute if score $get_coordinates.within_524288 iris matches 1 run function iris:get_coordinates/x/1