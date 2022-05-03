execute store success score $within_524288 retina if score $shift_z retina matches ..524287

execute if score $within_524288 retina matches 0 run scoreboard players remove $shift_z retina 524288
execute if score $within_524288 retina matches 0 positioned ~ ~ ~0.524288 run function retina:set_coordinates/z/1
execute if score $within_524288 retina matches 1 run function retina:set_coordinates/z/1

# Clean up (this happens at the end of the 19 functions)
scoreboard players reset $within_524288 retina
scoreboard players reset $within_262144 retina
scoreboard players reset $within_131072 retina
scoreboard players reset $within_65536 retina
scoreboard players reset $within_32768 retina
scoreboard players reset $within_16384 retina
scoreboard players reset $within_8192 retina
scoreboard players reset $within_4096 retina
scoreboard players reset $within_2048 retina
scoreboard players reset $within_1024 retina
scoreboard players reset $within_512 retina
scoreboard players reset $within_256 retina
scoreboard players reset $within_128 retina
scoreboard players reset $within_64 retina
scoreboard players reset $within_32 retina
scoreboard players reset $within_16 retina
scoreboard players reset $within_8 retina
scoreboard players reset $within_4 retina
scoreboard players reset $within_2 retina
scoreboard players reset $within_1 retina