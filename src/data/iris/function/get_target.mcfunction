#> iris:get_target
#
# Returns information about the targeted block or entity
# To tell where a player is looking, anchoring to the eye position is needed: execute as <player> at @s anchored eyes positioned ^ ^ ^ run function iris:get_target
# Target information is saved to storage (see output below)
#
# @public
# @context an entity, their eye position, and their rotation
# @reads
#   storage iris:settings
#       target_entities: byte
#           Whether or not to look for entities
#           Defaults to false (0b)
#       max_distance: float
#           What distance to traverse before giving up
#           Defaults to 5
#       blacklist: string
#           A block or a block tag to ignore
#           Defaults to "#iris:shape_groups/air"
#           Should be reset or set to an empty string if unused
#       whitelist: string
#           A block or a block tag to look for (all other blocks are ignored)
#           Unset by default
#           Should be reset or set to an empty string if unused
#       callback: string
#           A command to run wherever the ray hits
#           If the raycast fails, the callback is never called
# @writes
#   storage iris:output
#       type: string
#           What the ray hit
#           One of "block", "entity" or "none"
#       distance: double
#           How long the ray traveled before hitting an obstacle
#           Unset if type is "none"
#       block: int[]
#           The integer coordinates of the tile that was hit
#           Set only if type is "block"
#       UUID: int[]
#           The UUID of the entity that was hit
#           Set only if type is "entity"
#       target
#           position: double[]
#               The exact position where the ray hit an obstacle
#           normal: int[]
#               The face normal at the point of collision; for example, if a block is being looked from above, this should be [0, 1, 0]
#           box
#               min: double[]
#                   The lower coordinates within the target tile (between 0.0 and 1.0) of the AABB that the ray hit
#               max: double[]
#                   The greater coordinates within the target tile of the AABB that the ray hit
#           face
#               min: double[]
#                   The lower coordinates within the target tile (between 0.0 and 1.0) of the face that the ray hit
#               max: double[]
#                   The greater coordinates within the target tile (between 0.0 and 1.0) of the face that the ray hit
#   score $total_distance iris
#       The distance (in millionths of a block) travelled by the ray before it hits a block
#       Unset if no block or entity is found
# @output
#   Result: The distance (in blocks, rounded up) before an obstacle is hit, 0 if no block or entity is found
#   Success: 1 if a block or entity was hit, 0 otherwise

# Reset tags, scores and storage
function iris:setup/cleanup

# Get initial position/rotation
function iris:get_position/main

# Start the loop
tag @s add iris.executing
execute store result score $max_distance iris run data get storage iris:settings max_distance 1000000
execute align xyz positioned ~0.5 ~0.5 ~0.5 run return run function iris:raycast/loop
