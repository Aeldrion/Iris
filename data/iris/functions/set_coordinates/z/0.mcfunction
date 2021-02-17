execute store success score $within_524288 iris if score $shift_z iris matches ..524287

execute if score $within_524288 iris matches 0 run scoreboard players remove $shift_z iris 524288
execute if score $within_524288 iris matches 0 positioned ~ ~ ~0.524288 run function iris:set_coordinates/z/1
execute if score $within_524288 iris matches 1 run function iris:set_coordinates/z/1

# Clean up (this happens at the end of the 19 functions)
scoreboard players reset $within_524288 iris
scoreboard players reset $within_262144 iris
scoreboard players reset $within_131072 iris
scoreboard players reset $within_65536 iris
scoreboard players reset $within_32768 iris
scoreboard players reset $within_16384 iris
scoreboard players reset $within_8192 iris
scoreboard players reset $within_4096 iris
scoreboard players reset $within_2048 iris
scoreboard players reset $within_1024 iris
scoreboard players reset $within_512 iris
scoreboard players reset $within_256 iris
scoreboard players reset $within_128 iris
scoreboard players reset $within_64 iris
scoreboard players reset $within_32 iris
scoreboard players reset $within_16 iris
scoreboard players reset $within_8 iris
scoreboard players reset $within_4 iris
scoreboard players reset $within_2 iris
scoreboard players reset $within_1 iris