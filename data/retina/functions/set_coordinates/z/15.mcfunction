execute store success score $within_16 retina if score $shift_z retina matches ..15

execute if score $within_16 retina matches 0 run scoreboard players remove $shift_z retina 16
execute if score $within_16 retina matches 0 positioned ~ ~ ~0.000016 run function retina:set_coordinates/z/16
execute if score $within_16 retina matches 1 run function retina:set_coordinates/z/16