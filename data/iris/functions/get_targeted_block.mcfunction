# Returns the position of the block targeted given the executing position and rotation
# To tell which block a player is facing, anchoring to the eye position is needed: execute as <player> at @s anchored eyes positioned ^ ^ ^ run function iris:get_target_block

# Get coordinates and rotation of the initial position
function iris:get_coordinates/main
summon minecraft:area_effect_cloud ~ ~ ~ {Tags: ["iris", "iris.ray"]}
teleport @e[type=minecraft:area_effect_cloud, tag=iris.ray] ~ ~ ~ ~ ~

# Start the loop
scoreboard players set $depth iris 0
scoreboard players set $max_depth iris 20
execute as @e[type=minecraft:area_effect_cloud, tag=iris.ray] at @s run function iris:raycast/loop