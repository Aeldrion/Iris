execute store success score $within_8 retina if score $shift_z retina matches ..7

execute if score $within_8 retina matches 0 run scoreboard players remove $shift_z retina 8
execute if score $within_8 retina matches 0 positioned ~ ~ ~0.000008 run function retina:set_coordinates/z/17
execute if score $within_8 retina matches 1 run function retina:set_coordinates/z/17