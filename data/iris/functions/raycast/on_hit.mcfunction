#> iris:raycast/on_hit
#
# Writes all available information about the encountered block or entity
# See iris:get_target for full documentation
#
# @private
# @within iris:raycast/loop

# Write target type (one of BLOCK, ENTITY)
execute if score $block_hit iris matches 1 if score $entity_hit iris matches 0 run data modify storage iris:output TargetType set value "BLOCK"
execute if score $entity_hit iris matches 1 if score $block_hit iris matches 0 run data modify storage iris:output TargetType set value "ENTITY"
execute if score $block_hit iris matches 1 if score $entity_hit iris matches 1 if score $block_distance iris <= $entity_distance iris run data modify storage iris:output TargetType set value "BLOCK"
execute if score $block_hit iris matches 1 if score $entity_hit iris matches 1 if score $block_distance iris > $entity_distance iris run data modify storage iris:output TargetType set value "ENTITY"

# Write targeted block/targeted entity
execute if data storage iris:output {TargetType: "BLOCK"} run data modify storage iris:output TargetedBlock set value [0, 0, 0]
execute if data storage iris:output {TargetType: "BLOCK"} store result storage iris:output TargetedBlock[0] int 1 run scoreboard players get $[x] iris
execute if data storage iris:output {TargetType: "BLOCK"} store result storage iris:output TargetedBlock[1] int 1 run scoreboard players get $[y] iris
execute if data storage iris:output {TargetType: "BLOCK"} store result storage iris:output TargetedBlock[2] int 1 run scoreboard players get $[z] iris
execute if data storage iris:output {TargetType: "BLOCK"} align xyz run summon minecraft:marker ~0.5 ~0.5 ~0.5 {Tags: ["iris", "iris.targeted_block"]}

execute if data storage iris:output {TargetType: "ENTITY"} run data modify storage iris:output TargetedEntity set from storage iris:data TargetedBox.entity_id
execute if data storage iris:output {TargetType: "ENTITY"} store result score $entity_id iris run data get storage iris:output TargetedEntity
execute if data storage iris:output {TargetType: "ENTITY"} as @e[tag=iris.possible_target] if score @s iris.id = $entity_id iris run tag @s add iris.targeted_entity
tag @e remove iris.possible_target

# Write targeted box/face
execute if data storage iris:output {TargetType: "BLOCK"} run data modify storage iris:output TargetedBox set from storage iris:data TargetedBox
execute if data storage iris:output {TargetType: "BLOCK"} run data modify storage iris:output TargetedFace set from storage iris:data TargetedFace

# Write total distance
execute if data storage iris:output {TargetType: "BLOCK"} run scoreboard players operation $total_distance iris += $block_distance iris
execute if data storage iris:output {TargetType: "ENTITY"} run scoreboard players operation $total_distance iris += $entity_distance iris
execute store result storage iris:output Distance double 0.000001 run scoreboard players get $total_distance iris

return run scoreboard players get $total_distance iris
