execute store success score $within_2048 iris if score $shift_z iris matches ..2047

execute if score $within_2048 iris matches 0 run scoreboard players remove $shift_z iris 2048
execute if score $within_2048 iris matches 0 positioned ~ ~ ~0.002048 run function iris:set_coordinates/z/9
execute if score $within_2048 iris matches 1 run function iris:set_coordinates/z/9