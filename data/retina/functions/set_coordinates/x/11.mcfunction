execute store success score $within_256 retina if score $shift_x retina matches ..255

execute if score $within_256 retina matches 0 run scoreboard players remove $shift_x retina 256
execute if score $within_256 retina matches 0 positioned ~0.000256 ~ ~ run function retina:set_coordinates/x/12
execute if score $within_256 retina matches 1 run function retina:set_coordinates/x/12