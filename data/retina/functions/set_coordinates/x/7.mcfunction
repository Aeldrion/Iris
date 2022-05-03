execute store success score $within_4096 retina if score $shift_x retina matches ..4095

execute if score $within_4096 retina matches 0 run scoreboard players remove $shift_x retina 4096
execute if score $within_4096 retina matches 0 positioned ~0.004096 ~ ~ run function retina:set_coordinates/x/8
execute if score $within_4096 retina matches 1 run function retina:set_coordinates/x/8