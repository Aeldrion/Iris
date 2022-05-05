execute store success score $within_8192 retina if score $shift_z retina matches ..8191

execute if score $within_8192 retina matches 0 run scoreboard players remove $shift_z retina 8192
execute if score $within_8192 retina matches 0 positioned ~ ~ ~0.008192 run function retina:set_coordinates/z/7
execute if score $within_8192 retina matches 1 run function retina:set_coordinates/z/7