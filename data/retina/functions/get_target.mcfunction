#> retina:get_target
#
# Returns the position of the block targeted
# To tell where a player is looking, anchoring to the eye position is needed: execute as <player> at @s anchored eyes positioned ^ ^ ^ run function retina:get_target_block
#
# @public
# @context a position and a rotation
# @input
#	storage retina:input
#		TargetEntities: byte
#			Whether or not to look for entities. Defaults to false.
#		MaxRecursionDepth: int
#			How many blocks to traverse before giving up. Defaults to 16.
# @output
#	score $total_distance retina
#		The distance travelled by the ray before it hits a block. 1,000,000 corresponds to one block. Unset if the maximum recursion depth is reached (i.e. if the ray travels at least 20 blocks).
#	storage retina:output
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
kill @e[type=minecraft:marker, tag=retina.ray]
tag @e[type=!#retina:ignore] remove retina.target
data modify storage retina:output Target set value "NONE"
data remove storage retina:output Distance
data remove storage retina:output TargetedBlock
data remove storage retina:output TargetedEntity
data remove storage retina:output ContactSurface
data remove storage retina:output ContactCoordinates
data remove storage retina:output PlacingPosition
scoreboard players set $depth retina 0
scoreboard players set $total_distance retina 0
scoreboard players set $ray_hits_block retina 0
scoreboard players set $ray_hits_entity retina 0
scoreboard players set $ray_hits_surface retina 0

# Get coordinates and rotation of the initial position
function retina:get_coordinates/main
summon minecraft:marker ~ ~ ~ {Tags: ["retina", "retina.ray"]}

# Start the loop
tag @s add retina.executing
execute store result score $max_depth retina run data get storage retina:input MaxRecursionDepth
execute as @e[type=minecraft:marker, tag=retina.ray] at @s run function retina:raycast/loop
tag @s remove retina.executing