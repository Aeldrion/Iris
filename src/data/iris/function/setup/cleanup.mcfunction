#> iris:setup/cleanup
#
# Resets tags, scores, storages and spawned entities before starting a new raycast
#
# @within iris:get_target

# Reset tags
tag @e remove iris.executing
tag @e remove iris.targeted_entity
tag @e remove iris.possible_target

# Reset and initialize scores
scoreboard players reset * iris.id
scoreboard players set $depth iris 0
scoreboard players set $min_distance iris 2147483647
scoreboard players set $max_entity_id iris 0
scoreboard players set $total_distance iris 0

# Reset and initialize storage
data modify storage iris:output type set value "none"
data remove storage iris:output distance
data remove storage iris:output block
data remove storage iris:output target
data remove storage iris:output UUID
execute if data storage iris:settings {whitelist: ""} run data remove storage iris:settings whitelist
execute if data storage iris:settings {blacklist: ""} run data remove storage iris:settings blacklist
execute if data storage iris:settings {callback: ""} run data remove storage iris:settings callback
