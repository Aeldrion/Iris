execute store success score $within_131072 retina if score $shift_x retina matches ..131071

execute if score $within_131072 retina matches 0 run scoreboard players remove $shift_x retina 131072
execute if score $within_131072 retina matches 0 positioned ~0.131072 ~ ~ run function retina:set_coordinates/x/3
execute if score $within_131072 retina matches 1 run function retina:set_coordinates/x/3