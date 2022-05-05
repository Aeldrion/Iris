#> retina:raycast/hit_entity
#
# Runs when the ray hits an entity and outputs all available information to storage
#
# @within retina:raycast/loop

# Target type
data modify storage retina:output Target set value "ENTITY"

# Targeted entity
data modify storage retina:output TargetedEntity set value {UUID: [I; 0, 0, 0, 0], Pos: [0.0f, 0.0f, 0.0f]}
execute as @e[type=!#retina:ignore, tag=retina.possible_target] if score @s retina.id = $closest_cuboid_id retina run tag @s add retina.target
data modify storage retina:data Entity set from entity @e[type=!#retina:ignore, tag=retina.target, limit=1]
data modify storage retina:output TargetedEntity.UUID set from storage retina:data Entity.UUID
data modify storage retina:output TargetedEntity.Pos set from storage retina:data Entity.Pos
data remove storage retina:data Entity

# Contact surface
data modify storage retina:output ContactSurface set from storage retina:data ContactSurface

# Contact coordinates
data modify storage retina:output ContactCoordinates set value [0.0d, 0.0d, 0.0d]
execute store result storage retina:output ContactCoordinates[0] double 0.000001 run scoreboard players get $targeted_x retina
execute store result storage retina:output ContactCoordinates[1] double 0.000001 run scoreboard players get $targeted_y retina
execute store result storage retina:output ContactCoordinates[2] double 0.000001 run scoreboard players get $targeted_z retina
scoreboard players operation ${x} retina = $targeted_x retina
scoreboard players operation ${y} retina = $targeted_y retina
scoreboard players operation ${z} retina = $targeted_z retina

# Total distance
scoreboard players operation $entity_distance retina *= $1000 retina
scoreboard players operation $total_distance retina += $entity_distance retina
execute store result storage retina:output Distance double 0.000001 run scoreboard players get $total_distance retina

# Exit loop
scoreboard players operation $depth retina = $max_depth retina