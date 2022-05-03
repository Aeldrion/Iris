execute store success score $within_4096 retina if score $shift_z retina matches ..4095

execute if score $within_4096 retina matches 0 run scoreboard players remove $shift_z retina 4096
execute if score $within_4096 retina matches 0 positioned ~ ~ ~0.004096 run function retina:set_coordinates/z/8
execute if score $within_4096 retina matches 1 run function retina:set_coordinates/z/8