execute store success score $within_32768 retina if score $shift_z retina matches ..32767

execute if score $within_32768 retina matches 0 run scoreboard players remove $shift_z retina 32768
execute if score $within_32768 retina matches 0 positioned ~ ~ ~0.032768 run function retina:set_coordinates/z/5
execute if score $within_32768 retina matches 1 run function retina:set_coordinates/z/5