execute store success score $within_262144 retina if score $shift_z retina matches ..262143

execute if score $within_262144 retina matches 0 run scoreboard players remove $shift_z retina 262144
execute if score $within_262144 retina matches 0 positioned ~ ~ ~0.262144 run function retina:set_coordinates/z/2
execute if score $within_262144 retina matches 1 run function retina:set_coordinates/z/2