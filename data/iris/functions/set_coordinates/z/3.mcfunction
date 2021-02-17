execute store success score $within_65536 iris if score $shift_z iris matches ..65535

execute if score $within_65536 iris matches 0 run scoreboard players remove $shift_z iris 65536
execute if score $within_65536 iris matches 0 positioned ~ ~ ~0.065536 run function iris:set_coordinates/z/4
execute if score $within_65536 iris matches 1 run function iris:set_coordinates/z/4