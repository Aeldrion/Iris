execute store success score $within_256 iris if score $shift_x iris matches ..255

execute if score $within_256 iris matches 0 run scoreboard players remove $shift_x iris 256
execute if score $within_256 iris matches 0 positioned ~0.000256 ~ ~ run function iris:set_coordinates/x/12
execute if score $within_256 iris matches 1 run function iris:set_coordinates/x/12