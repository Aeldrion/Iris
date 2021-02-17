execute store success score $within_1024 iris if score $shift_z iris matches ..1023

execute if score $within_1024 iris matches 0 run scoreboard players remove $shift_z iris 1024
execute if score $within_1024 iris matches 0 positioned ~ ~ ~0.001024 run function iris:set_coordinates/z/10
execute if score $within_1024 iris matches 1 run function iris:set_coordinates/z/10