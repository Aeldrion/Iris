#> iris:get_block_surfaces/main
#
# Returns a list of surfaces of the current block
#
# @within iris:raycast/on_block_found
# @output
#	storage iris:block Surfaces
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

data remove storage iris:block Surfaces
execute store result score $block.is_cubic iris store result score $block.is_slab iris store result score $block.is_bed iris store result score $block.is_button iris store result score $block.is_door iris store result score $block.is_pressure_plate iris store result score $block.is_saplings iris store result score $block.is_standing_sign_or_banner iris store result score $block.is_carpet iris store result score $block.is_fence iris store result score $block.is_fence_gate iris run scoreboard players set $block_found iris 0

# Slabs
execute if score $block_found iris matches 0 store success score $block_found iris store success score $block.is_slab iris if block ~ ~ ~ #minecraft:slabs
execute if score $block.is_slab iris matches 1 run function iris:get_block_surfaces/block/slabs

# Beds
execute if score $block_found iris matches 0 store success score $block_found iris store success score $block.is_bed iris if block ~ ~ ~ #minecraft:beds
execute if score $block.is_bed iris matches 1 run function iris:get_block_surfaces/block/beds

# Buttons
execute if score $block_found iris matches 0 store success score $block_found iris store success score $block.is_button iris if block ~ ~ ~ #minecraft:buttons
execute if score $block.is_button iris matches 1 run function iris:get_block_surfaces/block/buttons

# Doors
execute if score $block_found iris matches 0 store success score $block_found iris store success score $block.is_door iris if block ~ ~ ~ #minecraft:doors
execute if score $block.is_door iris matches 1 run function iris:get_block_surfaces/block/doors

# Pressure plates
execute if score $block_found iris matches 0 store success score $block_found iris store success score $block.is_pressure_plate iris if block ~ ~ ~ #minecraft:pressure_plates
execute if score $block.is_pressure_plate iris matches 1 run function iris:get_block_surfaces/block/pressure_plates

# Saplings
execute if score $block_found iris matches 0 store success score $block_found iris store success score $block.is_sapling iris if block ~ ~ ~ #minecraft:saplings
execute if score $block.is_sapling iris matches 1 run function iris:get_block_surfaces/block/saplings

# Standing signs, banners
execute if score $block_found iris matches 0 store success score $block_found iris store success score $block.is_standing_sign_or_banner iris if block ~ ~ ~ #iris:standing_signs_and_banners
execute if score $block.is_standing_sign_or_banner iris matches 1 run function iris:get_block_surfaces/block/standing_signs_and_banners

# Carpets
execute if score $block_found iris matches 0 store success score $block_found iris store success score $block.is_carpet iris if block ~ ~ ~ #minecraft:carpets
execute if score $block.is_carpet iris matches 1 run function iris:get_block_surfaces/block/carpets

# Fences
execute if score $block_found iris matches 0 store success score $block_found iris store success score $block.is_fence iris if block ~ ~ ~ #minecraft:fences
execute if score $block.is_fence iris matches 1 run function iris:get_block_surfaces/block/fences

# Fence gates
execute if score $block_found iris matches 0 store success score $block_found iris store success score $block.is_fence_gate iris if block ~ ~ ~ #minecraft:fence_gates
execute if score $block.is_fence_gate iris matches 1 run function iris:get_block_surfaces/block/fence_gates

# 1x1x1 cubic blocks (all other blocks)
execute if score $block_found iris matches 0 store success score $block_found iris run scoreboard players set $block.is_cubic iris 1
execute if score $block.is_cubic iris matches 1 run function iris:get_block_surfaces/block/cubic
