execute store success score $within_16 iris if score $shift_x iris matches ..15

execute if score $within_16 iris matches 0 run scoreboard players remove $shift_x iris 16
execute if score $within_16 iris matches 0 positioned ~0.000016 ~ ~ run function iris:set_coordinates/x/16
execute if score $within_16 iris matches 1 run function iris:set_coordinates/x/16