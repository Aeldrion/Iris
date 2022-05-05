execute store success score $within_16384 retina if score $shift_x retina matches ..16383

execute if score $within_16384 retina matches 0 run scoreboard players remove $shift_x retina 16384
execute if score $within_16384 retina matches 0 positioned ~0.016384 ~ ~ run function retina:set_coordinates/x/6
execute if score $within_16384 retina matches 1 run function retina:set_coordinates/x/6