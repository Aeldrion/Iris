execute store success score $within_128 retina if score $shift_z retina matches ..127

execute if score $within_128 retina matches 0 run scoreboard players remove $shift_z retina 128
execute if score $within_128 retina matches 0 positioned ~ ~ ~0.000128 run function retina:set_coordinates/z/13
execute if score $within_128 retina matches 1 run function retina:set_coordinates/z/13