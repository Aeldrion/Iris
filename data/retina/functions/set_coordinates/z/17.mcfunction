execute store success score $within_4 retina if score $shift_z retina matches ..3

execute if score $within_4 retina matches 0 run scoreboard players remove $shift_z retina 4
execute if score $within_4 retina matches 0 positioned ~ ~ ~0.000004 run function retina:set_coordinates/z/18
execute if score $within_4 retina matches 1 run function retina:set_coordinates/z/18