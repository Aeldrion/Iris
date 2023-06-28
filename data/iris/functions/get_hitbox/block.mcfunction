#> iris:get_hitbox/block
#
# Returns a list of surfaces of the current blockg
## TODO Finish tree thing; see what's up with tags and carpets
#
# @within iris:raycast/on_block_found
# @output
#	storage iris:data Surfaces
#		Top: int[][]
#			A list of rectangular surfaces visible from above. Each surface is defined by six numbers, two sets of coordinates corresponding to opposite corners of the surface.
#		Bottom: int[][]
#			A list of rectangular surfaces visible from below. Each surface is defined by six numbers, two sets of coordinates corresponding to opposite corners of the surface.
#		East: int[][]
#			A list of rectangular surfaces facing east. Each surface is defined by six numbers, two sets of coordinates corresponding to opposite corners of the surface.
#		West: int[][]
#			A list of rectangular surfaces facing west. Each surface is defined by six numbers, two sets of coordinates corresponding to opposite corners of the surface.
#		North: int[][]
#			A list of rectangular surfaces facing north. Each surface is defined by six numbers, two sets of coordinates corresponding to opposite corners of the surface.
#		South: int[][]
#			A list of rectangular surfaces facing south. Each surface is defined by six numbers, two sets of coordinates corresponding to opposite corners of the surface.

scoreboard players set $block_found iris 0

execute if score $block_found iris matches 0 if block ~ ~ ~ #iris:tree/0 run function iris:get_hitbox/block/tree/0
execute if score $block_found iris matches 0 if block ~ ~ ~ #iris:tree/1 run function iris:get_hitbox/block/tree/1
execute if score $block_found iris matches 0 if block ~ ~ ~ #iris:tree/2 run function iris:get_hitbox/block/tree/2
execute if score $block_found iris matches 0 if block ~ ~ ~ #iris:tree/3 run function iris:get_hitbox/block/tree/3
execute if score $block_found iris matches 0 if block ~ ~ ~ #iris:tree/4 run function iris:get_hitbox/block/tree/4

execute if score $block_found iris matches 0 run function iris:get_hitbox/block/cubic

