#> iris:raycast/hit_entity
#
# Runs when the ray hits an entity and outputs all available information to storage
#
# @within iris:raycast/loop

# Target type
data modify storage iris:output Target set value "ENTITY"

# Targeted entity
data modify storage iris:output TargetedEntity set value {UUID: [I; 0, 0, 0, 0], Pos: [0.0f, 0.0f, 0.0f]}
execute as @e[type=!#iris:ignore, tag=iris.possible_target] if score @s iris.id = $closest_cuboid_id iris run tag @s add iris.target
data modify storage iris:data Entity set from entity @e[type=!#iris:ignore, tag=iris.target, limit=1]
data modify storage iris:output TargetedEntity.UUID set from storage iris:data Entity.UUID
data modify storage iris:output TargetedEntity.Pos set from storage iris:data Entity.Pos
data remove storage iris:data Entity

# Contact surface
data modify storage iris:output ContactSurface set from storage iris:data ContactSurface

# Contact coordinates
data modify storage iris:output ContactCoordinates set value [0.0d, 0.0d, 0.0d]
execute store result storage iris:output ContactCoordinates[0] double 0.000001 run scoreboard players get $targeted_x iris
execute store result storage iris:output ContactCoordinates[1] double 0.000001 run scoreboard players get $targeted_y iris
execute store result storage iris:output ContactCoordinates[2] double 0.000001 run scoreboard players get $targeted_z iris
scoreboard players operation ${x} iris = $targeted_x iris
scoreboard players operation ${y} iris = $targeted_y iris
scoreboard players operation ${z} iris = $targeted_z iris

# Total distance
scoreboard players operation $entity_distance iris *= $1000 iris
scoreboard players operation $total_distance iris += $entity_distance iris
execute store result storage iris:output Distance double 0.000001 run scoreboard players get $total_distance iris

# Exit loop
scoreboard players operation $depth iris = $max_depth iris