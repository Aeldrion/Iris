#> iris:get_target
#
# Returns the position of the block targeted
# To tell where a player is looking, anchoring to the eye position is needed: execute as <player> at @s anchored eyes positioned ^ ^ ^ run function iris:get_target
# Targeted block/entity information is sent to storage (see output below) but a marker with tag 'iris.ray' is also present in the targeted block after running this function
#
# @public
# @context an entity, their eye position, and their rotation
# @reads
#   storage iris:settings
#       TargetEntities: byte
#           Whether or not to look for entities
#           Defaults to false
#       MaxRecursionDepth: int
#           How many blocks to traverse before giving up
#           Defaults to 16
#       Blacklist: string
#           A block or a block tag to ignore
#           Defaults to "#iris:air"
# @writes
#   storage iris:output
#       TargetType: string
#           What the ray hits
#           One of "BLOCK", "ENTITY", or "NONE"
#       TargetedBlock: int[]
#           The integer coordinates of the block that is hit
#           Corresponds to the "Targeted Block" field in the debug screen
#           Unset if the ray hits an entity or if no block is found
#       TargetedEntity: int
#           The ID of the targeted entity on objective iris.entity_id
#           The entity executing this function cannot be targeted
#           Unset if the ray first hits a block or if no entity is found
#       Distance: double
#           How long the ray travels before hitting an obstacle
#           Unset if no block or entity is found
#   score $total_distance iris
#       The distance (in µm) travelled by the ray before it hits a block
#       Unset if no block or entity is found
# @output
#   Result: The distance (in blocks, rounded up) before an obstacle is hit, 0 if no block or entity is found
#   Success: 1 if a block or entity was hit, 0 otherwise

# Reset tags, scores and storage
kill @e[type=minecraft:marker, tag=iris.ray]
tag @e[type=!#iris:ignore] remove iris.target

data modify storage iris:output TargetType set value "NONE"
data remove storage iris:output TargetedBlock
data remove storage iris:output TargetedEntity
data remove storage iris:output Distance

scoreboard players set $depth iris 0
scoreboard players set $min_distance iris 2147483647
scoreboard players set $max_entity_id iris 0
scoreboard players set $total_distance iris 0

# Get initial position/rotation
execute summon minecraft:marker run function iris:get_coordinates/main

# Start the loop
summon minecraft:marker ~ ~ ~ {Tags: ["iris", "iris.ray"]}
tag @s add iris.executing
execute store result score $max_depth iris run data get storage iris:settings MaxRecursionDepth
execute as @e[type=minecraft:marker, tag=iris.ray] at @s run return run function iris:raycast/loop
