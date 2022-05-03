execute store success score $within_524288 retina if score $shift_x retina matches ..524287

execute if score $within_524288 retina matches 0 run scoreboard players remove $shift_x retina 524288
execute if score $within_524288 retina matches 0 positioned ~0.524288 ~ ~ run function retina:set_coordinates/x/1
execute if score $within_524288 retina matches 1 run function retina:set_coordinates/x/1