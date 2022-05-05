execute store success score $within_2048 retina if score $shift_x retina matches ..2047

execute if score $within_2048 retina matches 0 run scoreboard players remove $shift_x retina 2048
execute if score $within_2048 retina matches 0 positioned ~0.002048 ~ ~ run function retina:set_coordinates/x/9
execute if score $within_2048 retina matches 1 run function retina:set_coordinates/x/9