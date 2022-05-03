execute store success score $within_128 retina if score $shift_x retina matches ..127

execute if score $within_128 retina matches 0 run scoreboard players remove $shift_x retina 128
execute if score $within_128 retina matches 0 positioned ~0.000128 ~ ~ run function retina:set_coordinates/x/13
execute if score $within_128 retina matches 1 run function retina:set_coordinates/x/13