# Teleports the executing entity to the current coordinates (int only)

# Save to storage
data modify storage iris:data EntityTag.Pos set value [0.0d, 0.0d, 0.0d]
execute store result storage iris:data EntityTag.Pos[0] double 1 run scoreboard players get $[x] iris
execute store result storage iris:data EntityTag.Pos[1] double 1 run scoreboard players get $[y] iris
execute store result storage iris:data EntityTag.Pos[2] double 1 run scoreboard players get $[z] iris

# Apply
data modify entity @s Pos set from storage iris:data EntityTag.Pos