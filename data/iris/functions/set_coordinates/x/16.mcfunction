execute store success score $within_8 iris if score $shift_x iris matches ..7

execute if score $within_8 iris matches 0 run scoreboard players remove $shift_x iris 8
execute if score $within_8 iris matches 0 positioned ~0.000008 ~ ~ run function iris:set_coordinates/x/17
execute if score $within_8 iris matches 1 run function iris:set_coordinates/x/17