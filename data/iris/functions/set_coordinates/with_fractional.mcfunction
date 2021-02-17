# Teleports the executing entity to the current coordinates

# Calculate y position (this one's fine because there's no risk of overflows)
scoreboard players operation $y iris = $[y] iris
scoreboard players operation $y iris *= $1000000 iris
scoreboard players operation $y iris += ${y} iris

# Save to storage
data modify storage iris:data EntityTag.Pos set value [0.0d, 0.0d, 0.0d]
execute store result storage iris:data EntityTag.Pos[0] double 1 run scoreboard players get $[x] iris
execute store result storage iris:data EntityTag.Pos[1] double 0.000001 run scoreboard players get $y iris
execute store result storage iris:data EntityTag.Pos[2] double 1 run scoreboard players get $[z] iris

# Apply position and also shift position a tiny bit more
data modify entity @s Pos set from storage iris:data EntityTag.Pos
scoreboard players operation $shift_x iris = ${x} iris
scoreboard players operation $shift_z iris = ${z} iris
execute at @s run function iris:set_coordinates/x/0
execute at @s run function iris:set_coordinates/z/0

# Clean up
scoreboard players reset $shift_x iris
scoreboard players reset $shift_z iris