execute store success score $within_131072 iris if score $shift_x iris matches ..131071

execute if score $within_131072 iris matches 0 run scoreboard players remove $shift_x iris 131072
execute if score $within_131072 iris matches 0 positioned ~0.131072 ~ ~ run function iris:set_coordinates/x/3
execute if score $within_131072 iris matches 1 run function iris:set_coordinates/x/3