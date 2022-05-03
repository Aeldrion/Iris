execute store success score $within_1024 retina if score $shift_z retina matches ..1023

execute if score $within_1024 retina matches 0 run scoreboard players remove $shift_z retina 1024
execute if score $within_1024 retina matches 0 positioned ~ ~ ~0.001024 run function retina:set_coordinates/z/10
execute if score $within_1024 retina matches 1 run function retina:set_coordinates/z/10