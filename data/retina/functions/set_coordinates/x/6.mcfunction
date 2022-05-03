execute store success score $within_8192 retina if score $shift_x retina matches ..8191

execute if score $within_8192 retina matches 0 run scoreboard players remove $shift_x retina 8192
execute if score $within_8192 retina matches 0 positioned ~0.008192 ~ ~ run function retina:set_coordinates/x/7
execute if score $within_8192 retina matches 1 run function retina:set_coordinates/x/7