execute store success score $within_32 retina if score $shift_x retina matches ..31

execute if score $within_32 retina matches 0 run scoreboard players remove $shift_x retina 32
execute if score $within_32 retina matches 0 positioned ~0.000032 ~ ~ run function retina:set_coordinates/x/15
execute if score $within_32 retina matches 1 run function retina:set_coordinates/x/15