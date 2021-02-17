execute store success score $within_4 iris if score $shift_x iris matches ..3

execute if score $within_4 iris matches 0 run scoreboard players remove $shift_x iris 4
execute if score $within_4 iris matches 0 positioned ~0.000004 ~ ~ run function iris:set_coordinates/x/18
execute if score $within_4 iris matches 1 run function iris:set_coordinates/x/18