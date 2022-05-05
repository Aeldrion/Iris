# This function gets the fractional part of the z coordinate, executed as an area effect cloud by retina:get_coordinates/as_marker
# Due to overflows, storing with a high scale was not possible. This method compares the executing position - aligned to the block grid - to the executing entity

execute store result score $get_coordinates.within_524288 retina if entity @s[distance=..0.524288]

execute if score $get_coordinates.within_524288 retina matches 0 run scoreboard players add ${z} retina 524288
execute if score $get_coordinates.within_524288 retina matches 0 positioned ~ ~ ~0.524288 run function retina:get_coordinates/z/1
execute if score $get_coordinates.within_524288 retina matches 1 run function retina:get_coordinates/z/1

# Clean up (runs after all functions in this folder have been executed)
scoreboard players reset $get_coordinates.within_524288 retina
scoreboard players reset $get_coordinates.within_262144 retina
scoreboard players reset $get_coordinates.within_131072 retina
scoreboard players reset $get_coordinates.within_65536 retina
scoreboard players reset $get_coordinates.within_32768 retina
scoreboard players reset $get_coordinates.within_16384 retina
scoreboard players reset $get_coordinates.within_8192 retina
scoreboard players reset $get_coordinates.within_4096 retina
scoreboard players reset $get_coordinates.within_2048 retina
scoreboard players reset $get_coordinates.within_1024 retina
scoreboard players reset $get_coordinates.within_512 retina
scoreboard players reset $get_coordinates.within_256 retina
scoreboard players reset $get_coordinates.within_128 retina
scoreboard players reset $get_coordinates.within_64 retina
scoreboard players reset $get_coordinates.within_32 retina
scoreboard players reset $get_coordinates.within_16 retina
scoreboard players reset $get_coordinates.within_8 retina
scoreboard players reset $get_coordinates.within_4 retina
scoreboard players reset $get_coordinates.within_2 retina
scoreboard players reset $get_coordinates.within_1 retina