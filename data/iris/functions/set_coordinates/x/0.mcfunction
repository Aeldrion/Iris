execute store success score $within_524288 iris if score $shift_x iris matches ..524287

execute if score $within_524288 iris matches 0 run scoreboard players remove $shift_x iris 524288
execute if score $within_524288 iris matches 0 positioned ~0.524288 ~ ~ run function iris:set_coordinates/x/1
execute if score $within_524288 iris matches 1 run function iris:set_coordinates/x/1