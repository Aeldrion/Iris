execute store success score $within_2048 iris if score $shift_x iris matches ..2047

execute if score $within_2048 iris matches 0 run scoreboard players remove $shift_x iris 2048
execute if score $within_2048 iris matches 0 positioned ~0.002048 ~ ~ run function iris:set_coordinates/x/9
execute if score $within_2048 iris matches 1 run function iris:set_coordinates/x/9