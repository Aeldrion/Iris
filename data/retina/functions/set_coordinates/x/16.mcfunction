execute store success score $within_8 retina if score $shift_x retina matches ..7

execute if score $within_8 retina matches 0 run scoreboard players remove $shift_x retina 8
execute if score $within_8 retina matches 0 positioned ~0.000008 ~ ~ run function retina:set_coordinates/x/17
execute if score $within_8 retina matches 1 run function retina:set_coordinates/x/17