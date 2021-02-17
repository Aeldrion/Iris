execute store success score $within_512 iris if score $shift_x iris matches ..511

execute if score $within_512 iris matches 0 run scoreboard players remove $shift_x iris 512
execute if score $within_512 iris matches 0 positioned ~0.000512 ~ ~ run function iris:set_coordinates/x/11
execute if score $within_512 iris matches 1 run function iris:set_coordinates/x/11