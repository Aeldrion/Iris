# Output current position as targeted block
data modify storage iris:output TargetedBlock set value [0, 0, 0]
execute store result storage iris:output TargetedBlock[0] int 1 run scoreboard players get $[x] iris
execute store result storage iris:output TargetedBlock[1] int 1 run scoreboard players get $[y] iris
execute store result storage iris:output TargetedBlock[2] int 1 run scoreboard players get $[z] iris
scoreboard players set $ray_hits_surface iris 1

# End loop
scoreboard players operation $depth iris = $max_depth iris