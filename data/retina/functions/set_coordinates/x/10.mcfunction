execute store success score $within_512 retina if score $shift_x retina matches ..511

execute if score $within_512 retina matches 0 run scoreboard players remove $shift_x retina 512
execute if score $within_512 retina matches 0 positioned ~0.000512 ~ ~ run function retina:set_coordinates/x/11
execute if score $within_512 retina matches 1 run function retina:set_coordinates/x/11