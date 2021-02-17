execute store success score $within_16384 iris if score $shift_x iris matches ..16383

execute if score $within_16384 iris matches 0 run scoreboard players remove $shift_x iris 16384
execute if score $within_16384 iris matches 0 positioned ~0.016384 ~ ~ run function iris:set_coordinates/x/6
execute if score $within_16384 iris matches 1 run function iris:set_coordinates/x/6