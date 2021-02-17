execute store success score $within_4096 iris if score $shift_x iris matches ..4095

execute if score $within_4096 iris matches 0 run scoreboard players remove $shift_x iris 4096
execute if score $within_4096 iris matches 0 positioned ~0.004096 ~ ~ run function iris:set_coordinates/x/8
execute if score $within_4096 iris matches 1 run function iris:set_coordinates/x/8