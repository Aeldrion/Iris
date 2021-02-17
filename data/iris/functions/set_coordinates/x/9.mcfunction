execute store success score $within_1024 iris if score $shift_x iris matches ..1023

execute if score $within_1024 iris matches 0 run scoreboard players remove $shift_x iris 1024
execute if score $within_1024 iris matches 0 positioned ~0.001024 ~ ~ run function iris:set_coordinates/x/10
execute if score $within_1024 iris matches 1 run function iris:set_coordinates/x/10