execute store success score $within_32 iris if score $shift_z iris matches ..31

execute if score $within_32 iris matches 0 run scoreboard players remove $shift_z iris 32
execute if score $within_32 iris matches 0 positioned ~ ~ ~0.000032 run function iris:set_coordinates/z/15
execute if score $within_32 iris matches 1 run function iris:set_coordinates/z/15