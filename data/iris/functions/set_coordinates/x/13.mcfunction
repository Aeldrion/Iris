execute store success score $within_64 iris if score $shift_x iris matches ..63

execute if score $within_64 iris matches 0 run scoreboard players remove $shift_x iris 64
execute if score $within_64 iris matches 0 positioned ~0.000064 ~ ~ run function iris:set_coordinates/x/14
execute if score $within_64 iris matches 1 run function iris:set_coordinates/x/14