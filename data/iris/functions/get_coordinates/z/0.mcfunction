# This function gets the fractional part of the z coordinate, executed as an area effect cloud by iris:get_coordinates/as_marker
# Due to overflows, storing with a high scale was not possible. This method compares the executing position - aligned to the block grid - to the executing entity

execute store result score $get_coordinates.within_524288 iris if entity @s[distance=..0.524288]

execute if score $get_coordinates.within_524288 iris matches 0 run scoreboard players add ${z} iris 524288
execute if score $get_coordinates.within_524288 iris matches 0 positioned ~ ~ ~0.524288 run function iris:get_coordinates/z/1
execute if score $get_coordinates.within_524288 iris matches 1 run function iris:get_coordinates/z/1

# Clean up (runs after all functions in this folder have been executed)
scoreboard players reset $get_coordinates.within_524288 iris
scoreboard players reset $get_coordinates.within_262144 iris
scoreboard players reset $get_coordinates.within_131072 iris
scoreboard players reset $get_coordinates.within_65536 iris
scoreboard players reset $get_coordinates.within_32768 iris
scoreboard players reset $get_coordinates.within_16384 iris
scoreboard players reset $get_coordinates.within_8192 iris
scoreboard players reset $get_coordinates.within_4096 iris
scoreboard players reset $get_coordinates.within_2048 iris
scoreboard players reset $get_coordinates.within_1024 iris
scoreboard players reset $get_coordinates.within_512 iris
scoreboard players reset $get_coordinates.within_256 iris
scoreboard players reset $get_coordinates.within_128 iris
scoreboard players reset $get_coordinates.within_64 iris
scoreboard players reset $get_coordinates.within_32 iris
scoreboard players reset $get_coordinates.within_16 iris
scoreboard players reset $get_coordinates.within_8 iris
scoreboard players reset $get_coordinates.within_4 iris
scoreboard players reset $get_coordinates.within_2 iris
scoreboard players reset $get_coordinates.within_1 iris