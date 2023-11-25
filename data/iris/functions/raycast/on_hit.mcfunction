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
execute if data storage iris:output {TargetType: "ENTITY"} run data modify storage iris:output TargetedEntity set from storage iris:data TargetedBox.entity_id

# Write total distance
execute store result storage iris:output Distance double 0.000001 run scoreboard players get $total_distance iris

return 1
