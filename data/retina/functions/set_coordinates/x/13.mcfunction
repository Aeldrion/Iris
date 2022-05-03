execute store success score $within_64 retina if score $shift_x retina matches ..63

execute if score $within_64 retina matches 0 run scoreboard players remove $shift_x retina 64
execute if score $within_64 retina matches 0 positioned ~0.000064 ~ ~ run function retina:set_coordinates/x/14
execute if score $within_64 retina matches 1 run function retina:set_coordinates/x/14