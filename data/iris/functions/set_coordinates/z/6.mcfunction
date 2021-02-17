execute store success score $within_8192 iris if score $shift_z iris matches ..8191

execute if score $within_8192 iris matches 0 run scoreboard players remove $shift_z iris 8192
execute if score $within_8192 iris matches 0 positioned ~ ~ ~0.008192 run function iris:set_coordinates/z/7
execute if score $within_8192 iris matches 1 run function iris:set_coordinates/z/7