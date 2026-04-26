#> iris:raycast/on_hit
#
# Writes all available information about the encountered block or entity
# See iris:get_target for full documentation
#
# @within iris:raycast/loop

# Write target type (one of block, entity)
execute if score $block_hit iris matches 1 if score $entity_hit iris matches 0 run data modify storage iris:output type set value "block"
execute if score $entity_hit iris matches 1 if score $block_hit iris matches 0 run data modify storage iris:output type set value "entity"
execute if score $block_hit iris matches 1 if score $entity_hit iris matches 1 if score $block_distance iris <= $entity_distance iris run data modify storage iris:output target set value "block"
execute if score $block_hit iris matches 1 if score $entity_hit iris matches 1 if score $block_distance iris > $entity_distance iris run data modify storage iris:output target set value "entity"

# Write targeted block
execute if data storage iris:output {type: "block"} run data modify storage iris:output block set value [0, 0, 0]
execute if data storage iris:output {type: "block"} store result storage iris:output block[0] int 1 run scoreboard players get $[x] iris
execute if data storage iris:output {type: "block"} store result storage iris:output block[1] int 1 run scoreboard players get $[y] iris
execute if data storage iris:output {type: "block"} store result storage iris:output block[2] int 1 run scoreboard players get $[z] iris

# Write targeted entity
execute if data storage iris:output {type: "entity"} store result score $entity_id iris run data get storage iris:data targeted_box.entity_id
execute if data storage iris:output {type: "entity"} run data remove storage iris:data targeted_box.entity_id
execute if data storage iris:output {type: "entity"} as @e[tag=iris.possible_target] if score @s iris.id = $entity_id iris run tag @s add iris.targeted_entity
execute if data storage iris:output {type: "entity"} as @e[tag=iris.targeted_entity] run data modify storage iris:output target.UUID set from entity @s UUID
execute if data storage iris:output {type: "entity"} run tag @e remove iris.possible_target

# Write target information
data modify storage iris:output target.box set from storage iris:data targeted_box
data modify storage iris:output target.face set from storage iris:data targeted_face
data modify storage iris:output target.normal set from storage iris:data targeted_face.normal
data remove storage iris:output target.face.collision
data remove storage iris:output target.face.normal

# Write target position
data modify storage iris:output target.position set value [0.0f, 0.0f, 0.0f]
execute store result score ${x} iris run data get storage iris:data targeted_face.collision[0] 1000000
execute store result score ${y} iris run data get storage iris:data targeted_face.collision[1] 1000000
execute store result score ${z} iris run data get storage iris:data targeted_face.collision[2] 1000000
function iris:raycast/macro_functions/compute_endpoint {axis: "x"}
data modify storage iris:output target.position[0] set from storage iris:data coordinate
function iris:raycast/macro_functions/compute_endpoint {axis: "y"}
data modify storage iris:output target.position[1] set from storage iris:data coordinate
function iris:raycast/macro_functions/compute_endpoint {axis: "z"}
data modify storage iris:output target.position[2] set from storage iris:data coordinate

# Write total distance
execute if data storage iris:output {type: "block"} run scoreboard players operation $total_distance iris += $block_distance iris
execute if data storage iris:output {type: "entity"} run scoreboard players operation $total_distance iris += $entity_distance iris
execute store result storage iris:output distance double 0.000001 run scoreboard players get $total_distance iris

# Run callback
execute if data storage iris:settings callback run data modify storage iris:args command set from storage iris:settings callback
execute if data storage iris:settings callback run function iris:raycast/macro_functions/callback with storage iris:args

return run scoreboard players get $total_distance iris
