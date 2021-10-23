#> iris:get_targeted_block
#
# Returns the position of the block targeted
# To tell which block a player is facing, anchoring to the eye position is needed: execute as <player> at @s anchored eyes positioned ^ ^ ^ run function iris:get_target_block
#
# @api
# @context a position and a rotation
# @output
#	score $total_distance iris
#		The distance travelled by the ray before it hits a block. 1,000,000 corresponds to one block. Unset if the maximum recursion depth is reached (i.e. if the ray travels at least 20 blocks).
#	storage iris:output
#		ContactSurface: double[]
#			The surface of the block the ray hits (six coordinates between 0 and 1000000, where 0 0 0 and 1000000 1000000 1000000 are opposite corners of the block)
#		ContactCoordinates: double[]
#			The exact position where the ray hits something within the targeted block (three coordinates between 0 and 1000000, where 0 0 0 and 1000000 1000000 1000000 are opposite corners of the block)
#		TargetedBlock: int[]
#			The integer coordinates of the block that the ray finds itself in when it hits something (i.e. the "targeted block")
#		PlacingPosition: int[]
#			The integer coordinates of the block before the ray hits something (i.e. where a block would be placed, if a player were to place a block)

# Kill any previously summoned ray marker and reset total distance
kill @e[type=minecraft:marker, tag=iris.ray]
scoreboard players set $total_distance iris 0

# Get coordinates and rotation of the initial position
function iris:get_coordinates/main
summon minecraft:marker ~ ~ ~ {Tags: ["iris", "iris.ray"]}
teleport @e[type=minecraft:marker, tag=iris.ray] ~ ~ ~ ~ ~

# Start the loop
scoreboard players set $depth iris 0
scoreboard players set $max_depth iris 50
tag @s add iris.executing
execute as @e[type=minecraft:marker, tag=iris.ray] at @s run function iris:raycast/loop
tag @s remove iris.executing