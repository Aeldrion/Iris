execute store success score $within_128 iris if score $shift_z iris matches ..127

execute if score $within_128 iris matches 0 run scoreboard players remove $shift_z iris 128
execute if score $within_128 iris matches 0 positioned ~ ~ ~0.000128 run function iris:set_coordinates/z/13
execute if score $within_128 iris matches 1 run function iris:set_coordinates/z/13