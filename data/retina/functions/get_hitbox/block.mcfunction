#> retina:get_hitbox/block
#
# Returns a list of surfaces of the current blockg
# TODO Organise non-cubic blocks in a block tag tree for logarithmic search
#
# @within retina:raycast/on_block_found
# @output
#	storage retina:data Surfaces
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

execute store result score $block.is_cubic retina store result score $block.is_anvil retina store result score $block.is_attached_stem retina store result score $block.is_bed retina store result score $block.is_beetroots retina store result score $block.is_brewing_stand retina store result score $block.is_button retina store result score $block.is_cactus retina store result score $block.is_campfire retina store result score $block.is_carpet retina store result score $block.is_cauldron retina store result score $block.is_chain retina store result score $block.is_chest retina store result score $block.is_composter retina store result score $block.is_conduit retina store result score $block.is_door retina store result score $block.is_farmland retina store result score $block.is_fence retina store result score $block.is_fence_gate retina store result score $block.is_grass retina store result score $block.is_iron_bars retina store result score $block.is_ladder retina store result score $is_lantern retina store result score $block.is_mushroom retina store result score $block.is_pressure_plate retina store result score $block.is_saplings retina store result score $block.is_slab retina store result score $block.is_special_rail retina store result score $block.is_sugar_cane retina store result score $block.is_stairs retina store result score $block.is_standing_sign_or_banner retina store result score $block.is_torch retina store result score $block.is_trapdoor retina store result score $block.is_wall retina store result score $block.is_wall_sign retina store result score $block.is_wall_torch retina run scoreboard players set $block_found retina 0

# Anvils
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_anvil retina if block ~ ~ ~ #minecraft:anvil
execute if score $block.is_anvil retina matches 1 run function retina:get_hitbox/block/anvils

# Attached stems
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_attached_stem retina if block ~ ~ ~ #retina:attached_stems
execute if score $block.is_attached_stem retina matches 1 run function retina:get_hitbox/block/attached_stems

# Beds
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_bed retina if block ~ ~ ~ #minecraft:beds
execute if score $block.is_bed retina matches 1 run function retina:get_hitbox/block/beds

# Beetroots
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_beetroots retina if block ~ ~ ~ minecraft:beetroots
execute if score $block.is_beetroots retina matches 1 run function retina:get_hitbox/block/beetroots

# Brewing stands
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_brewing_stand retina if block ~ ~ ~ minecraft:brewing_stand
execute if score $block.is_brewing_stand retina matches 1 run function retina:get_hitbox/block/brewing_stand

# Buttons
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_button retina if block ~ ~ ~ #minecraft:buttons
execute if score $block.is_button retina matches 1 run function retina:get_hitbox/block/buttons

# Cactus, dragon eggs
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_cactus retina if block ~ ~ ~ #retina:cactus_shaped
execute if score $block.is_cactus retina matches 1 run function retina:get_hitbox/block/cactus

# Campfires, soul campfires
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_campfire retina if block ~ ~ ~ #minecraft:campfires
execute if score $block.is_campfire retina matches 1 run function retina:get_hitbox/block/campfires

# Carpets
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_carpet retina if block ~ ~ ~ #minecraft:carpets
execute if score $block.is_carpet retina matches 1 run function retina:get_hitbox/block/carpets

# Cauldrons
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_cauldron retina if block ~ ~ ~ #minecraft:cauldrons
execute if score $block.is_cauldron retina matches 1 run function retina:get_hitbox/block/cauldrons

# Chains
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_chain retina if block ~ ~ ~ minecraft:chain
execute if score $block.is_chain retina matches 1 run function retina:get_hitbox/block/chain

# Chests, trapped chests
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_chest retina if block ~ ~ ~ #retina:chests
execute if score $block.is_chest retina matches 1 run function retina:get_hitbox/block/chest

# Composters
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_composter retina if block ~ ~ ~ minecraft:composter
execute if score $block.is_composter retina matches 1 run function retina:get_hitbox/block/composter

# Conduits
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_conduit retina if block ~ ~ ~ minecraft:conduit
execute if score $block.is_conduit retina matches 1 run function retina:get_hitbox/block/conduit

# Doors
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_door retina if block ~ ~ ~ #minecraft:doors
execute if score $block.is_door retina matches 1 run function retina:get_hitbox/block/doors

# Farmland, dirt paths
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_farmland retina if block ~ ~ ~ #retina:farmland_shaped
execute if score $block.is_farmland retina matches 1 run function retina:get_hitbox/block/farmland

# Fences
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_fence retina if block ~ ~ ~ #minecraft:fences
execute if score $block.is_fence retina matches 1 run function retina:get_hitbox/block/fences

# Fence gates
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_fence_gate retina if block ~ ~ ~ #minecraft:fence_gates
execute if score $block.is_fence_gate retina matches 1 run function retina:get_hitbox/block/fence_gates

# Grass, dead bushes, ferns
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_grass retina if block ~ ~ ~ #retina:grass_shaped
execute if score $block.is_grass retina matches 1 run function retina:get_hitbox/block/grass

# Iron bars, glass panes
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_iron_bars retina if block ~ ~ ~ #retina:iron_bars_and_glass_panes
execute if score $block.is_iron_bars retina matches 1 run function retina:get_hitbox/block/iron_bars

# Ladders
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_ladder retina if block ~ ~ ~ minecraft:ladder
execute if score $block.is_ladder retina matches 1 run function retina:get_hitbox/block/ladders

# Lanterns, soul lanterns
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_lantern retina if block ~ ~ ~ #retina:lanterns
execute if score $block.is_lantern retina matches 1 run function retina:get_hitbox/block/lanterns

# Brown mushrooms, red mushrooms, flower pots, potted plants
execute if score $block.found retina matches 0 store success score $block_found retina store success score $block.is_mushroom retina if block ~ ~ ~ #retina:mushroom_shaped
execute if score $block.is_mushroom retina matches 1 run function retina:get_hitbox/block/mushrooms

# Pressure plates
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_pressure_plate retina if block ~ ~ ~ #minecraft:pressure_plates
execute if score $block.is_pressure_plate retina matches 1 run function retina:get_hitbox/block/pressure_plates

# Saplings
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_sapling retina if block ~ ~ ~ #minecraft:saplings
execute if score $block.is_sapling retina matches 1 run function retina:get_hitbox/block/saplings

# Stairs
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_stairs retina if block ~ ~ ~ #minecraft:stairs
execute if score $block.is_stairs retina matches 1 run function retina:get_hitbox/block/stairs

# Slabs
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_slab retina if block ~ ~ ~ #minecraft:slabs
execute if score $block.is_slab retina matches 1 run function retina:get_hitbox/block/slabs

# Activator rails, detector rails, powered rails
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_special_rail retina if block ~ ~ ~ #retina:special_rails
execute if score $block.is_special_rail retina matches 1 run function retina:get_hitbox/block/special_rails

# Standing signs, banners
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_standing_sign_or_banner retina if block ~ ~ ~ #retina:standing_signs_and_banners
execute if score $block.is_standing_sign_or_banner retina matches 1 run function retina:get_hitbox/block/standing_signs_and_banners

# Sugar cane, tall seagrass
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_sugar_cane retina if block ~ ~ ~ #retina:sugar_cane_like
execute if score $block.is_sugar_cane retina matches 1 run function retina:get_hitbox/block/sugar_cane

# Torches, redstone torches, soul torches placed on the ground
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_torch retina if block ~ ~ ~ #retina:torches
execute if score $block.is_torch retina matches 1 run function retina:get_hitbox/block/torches

# Trapdoors
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_trapdoor retina if block ~ ~ ~ #minecraft:trapdoors
execute if score $block.is_trapdoor retina matches 1 run function retina:get_hitbox/block/trapdoors

# Walls
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_wall retina if block ~ ~ ~ #minecraft:walls
execute if score $block.is_wall retina matches 1 run function retina:get_hitbox/block/walls

# Wall signs
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_wall_sign retina if block ~ ~ ~ #minecraft:wall_signs
execute if score $block.is_wall_sign retina matches 1 run function retina:get_hitbox/block/wall_signs


# Wall torches, redstone torches, soul torches
execute if score $block_found retina matches 0 store success score $block_found retina store success score $block.is_wall_torch retina if block ~ ~ ~ #retina:wall_torches
execute if score $block.is_wall_torch retina matches 1 run function retina:get_hitbox/block/wall_torches

# 1x1x1 cubic blocks (all other blocks)
execute if score $block_found retina matches 0 store success score $block_found retina run scoreboard players set $block.is_cubic retina 1
execute if score $block.is_cubic retina matches 1 run function retina:get_hitbox/block/cubic
