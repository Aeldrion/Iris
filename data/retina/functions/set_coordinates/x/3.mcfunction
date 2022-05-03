execute store success score $within_65536 retina if score $shift_x retina matches ..65535

execute if score $within_65536 retina matches 0 run scoreboard players remove $shift_x retina 65536
execute if score $within_65536 retina matches 0 positioned ~0.065536 ~ ~ run function retina:set_coordinates/x/4
execute if score $within_65536 retina matches 1 run function retina:set_coordinates/x/4