execute store success score $within_262144 iris if score $shift_x iris matches ..262143

execute if score $within_262144 iris matches 0 run scoreboard players remove $shift_x iris 262144
execute if score $within_262144 iris matches 0 positioned ~0.262144 ~ ~ run function iris:set_coordinates/x/2
execute if score $within_262144 iris matches 1 run function iris:set_coordinates/x/2