#> iris:get_target
#
# Returns the position of the block targeted
# To tell where a player is looking, anchoring to the eye position is needed: execute as <player> at @s anchored eyes positioned ^ ^ ^ run function iris:get_target_block
#
# @public
# @context a position and a rotation
# @input
#	storage iris:input
#		TargetEntities: byte
#			Whether or not to look for entities. Defaults to false.
#		MaxRecursionDepth: int
#			How many blocks to traverse before giving up. Defaults to 16.
# @output
#	score $total_distance iris
#		The distance travelled by the ray before it hits a block. 1,000,000 corresponds to one block. Unset if the maximum recursion depth is reached (i.e. if the ray travels at least 20 blocks).
#	storage iris:output
#		Target: string
#			"BLOCK" if the ray hits a block, "ENTITY" if the ray hits an entity, "NONE" if the ray hits nothing.
#		Distance: double
#			How long the ray travels before hitting an obstacle.
#		TargetedBlock: int[]
#			The integer coordinates of the block that the ray finds itself in when it hits something (i.e. the "targeted block"). Unset if the ray hits an entity or if no block is found.
#		TargetedEntity.Pos: float[]
#			The position of the targeted entity. Unset if the ray hits a block or if no entity is found.
#		TargetedEntity.UUID: int[]
#			The UUID of the targeted entity. Unset if the ray hits a block or if no entity is found.
#		ContactSurface: double[]
#			The surface of the block or entity the ray hits (six coordinates between 0 and 1000000, where 0 0 0 and 1000000 1000000 1000000 are opposite corners of the block). Unset if no block or entity is found.
#		ContactCoordinates: double[]
#			The exact position where the ray hits something within the targeted block (three coordinates between 0 and 1000000, where 0 0 0 and 1000000 1000000 1000000 are opposite corners of the block). Unset if no block or entity is found.
#		PlacingPosition: int[]
#			The integer coordinates of the block before the ray hits something (i.e. where a block would be placed, if a player were to place a block). Unset if the ray hits an entity or if no block is found.

# Reset tags, scores and storage
kill @e[type=minecraft:marker, tag=iris.ray]
tag @e[type=!#iris:ignore] remove iris.target
data modify storage iris:output Target set value "NONE"
data remove storage iris:output Distance
data remove storage iris:output TargetedBlock
data remove storage iris:output TargetedEntity
data remove storage iris:output ContactSurface
data remove storage iris:output ContactCoordinates
data remove storage iris:output PlacingPosition
scoreboard players set $depth iris 0
scoreboard players set $total_distance iris 0
scoreboard players set $ray_hits_block iris 0
scoreboard players set $ray_hits_entity iris 0
scoreboard players set $ray_hits_surface iris 0

# Get coordinates and rotation of the initial position
function iris:get_coordinates/main
summon minecraft:marker ~ ~ ~ {Tags: ["iris", "iris.ray"]}

# Start the loop
tag @s add iris.executing
execute store result score $max_depth iris run data get storage iris:input MaxRecursionDepth
execute as @e[type=minecraft:marker, tag=iris.ray] at @s run function iris:raycast/loop
tag @s remove iris.executing