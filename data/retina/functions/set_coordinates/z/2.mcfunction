execute store success score $within_131072 retina if score $shift_z retina matches ..131071

execute if score $within_131072 retina matches 0 run scoreboard players remove $shift_z retina 131072
execute if score $within_131072 retina matches 0 positioned ~ ~ ~0.131072 run function retina:set_coordinates/z/3
execute if score $within_131072 retina matches 1 run function retina:set_coordinates/z/3