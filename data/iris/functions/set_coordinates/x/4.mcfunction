execute store success score $within_32768 iris if score $shift_x iris matches ..32767

execute if score $within_32768 iris matches 0 run scoreboard players remove $shift_x iris 32768
execute if score $within_32768 iris matches 0 positioned ~0.032768 ~ ~ run function iris:set_coordinates/x/5
execute if score $within_32768 iris matches 1 run function iris:set_coordinates/x/5