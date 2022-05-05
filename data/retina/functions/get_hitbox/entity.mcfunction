#> retina:get_hitbox/entity
#
# Returns a list of surfaces of the executing entity
#
# @within retina:raycast/on_entity_found
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

execute store result score $entity.is_zombie_like retina store result score $entity.is_baby_zombie_like retina store result score $entity.is_cow retina store result score $entity.is_baby_cow retina store result score $entity.is_player_like retina store result score $entity.is_horse retina run scoreboard players set $entity_found retina 0

# Armour stands
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_armor_stand retina if entity @s[type=minecraft:armor_stand]
execute if score $entity.is_armor_stand retina matches 1 run function retina:get_hitbox/entity/armor_stand

# Axolotls
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_axolotl retina if entity @s[type=minecraft:axolotl]
execute if score $entity.is_axolotl retina matches 1 run function retina:get_hitbox/entity/axolotl

# Bats, parrots
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_bat_like retina if entity @s[type=#retina:bat_like]
execute if score $entity.is_bat_like retina matches 1 run function retina:get_hitbox/entity/bat_like

# Bees
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_bee retina if entity @s[type=minecraft:bee]
execute if score $entity.is_bee retina matches 1 run function retina:get_hitbox/entity/bee

# Boats
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_boat retina if entity @s[type=minecraft:boat]
execute if score $entity.is_boat retina matches 1 run function retina:get_hitbox/entity/boat

# Cats, foxes, ocelots
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_cat_like retina if entity @s[type=#retina:cat_like]
execute if score $entity.is_cat_like retina matches 1 run function retina:get_hitbox/entity/cat_like

# Cave spiders
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_cave_spider retina if entity @s[type=minecraft:cave_spider]
execute if score $entity.is_cave_spider retina matches 1 run function retina:get_hitbox/entity/cave_spider

# Chickens
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_chicken retina if entity @s[type=minecraft:chicken]
execute if score $entity.is_chicken retina matches 1 run function retina:get_hitbox/entity/chicken

# Cods
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_cod retina if entity @s[type=minecraft:cod]
execute if score $entity.is_cod retina matches 1 run function retina:get_hitbox/entity/cod

# Cows and mooshrooms
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_cow retina if entity @s[type=#retina:cows]
execute if score $entity.is_cow retina matches 1 run function retina:get_hitbox/entity/cow

# Creepers
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_creeper retina if entity @s[type=minecraft:creeper]
execute if score $entity.is_creeper retina matches 1 run function retina:get_hitbox/entity/creeper

# Dolphins
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_dolphin retina if entity @s[type=minecraft:dolphin]
execute if score $entity.is_dolphin retina matches 1 run function retina:get_hitbox/entity/dolphin

# Donkeys
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_donkey retina if entity @s[type=minecraft:donkey]
execute if score $entity.is_donkey retina matches 1 run function retina:get_hitbox/entity/donkey

# Elder guardians
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_elder_guardian retina if entity @s[type=minecraft:elder_guardian]
execute if score $entity.is_elder_guardian retina matches 1 run function retina:get_hitbox/entity/elder_guardian

# End crystals
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_end_crystal retina if entity @s[type=minecraft:end_crystal]
execute if score $entity.is_end_crystal retina matches 1 run function retina:get_hitbox/entity/end_crystal

# Endermen
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_enderman retina if entity @s[type=minecraft:enderman]
execute if score $entity.is_enderman retina matches 1 run function retina:get_hitbox/entity/enderman

# Endermites and silverfish
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_endermite_like retina if entity @s[type=#retina:endermite_like]
execute if score $entity.is_endermite_like retina matches 1 run function retina:get_hitbox/entity/endermite_like

# Falling blocks and primed TNT
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_falling_block_like retina if entity @s[type=#retina:falling_block_like]
execute if score $entity.is_falling_block_like retina matches 1 run function retina:get_hitbox/entity/falling_block_like

# Ghasts
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_ghast retina if entity @s[type=minecraft:ghast]
execute if score $entity.is_ghast retina matches 1 run function retina:get_hitbox/entity/ghast

# Giants
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_giant retina if entity @s[type=minecraft:giant]
execute if score $entity.is_giant retina matches 1 run function retina:get_hitbox/entity/giant

# Guardians
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_guardian retina if entity @s[type=minecraft:guardian]
execute if score $entity.is_guardian retina matches 1 run function retina:get_hitbox/entity/guardian

# Hoglins and zoglins
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_hoglin retina if entity @s[type=#retina:hoglins]
execute if score $entity.is_hoglin retina matches 1 run function retina:get_hitbox/entity/hoglin

# Horses and mules
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_horse retina if entity @s[type=#retina:horses]
execute if score $entity.is_horse retina matches 1 run function retina:get_hitbox/entity/horse

# Iron golems
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_iron_golem retina if entity @s[type=minecraft:iron_golem]
execute if score $entity.is_iron_golem retina matches 1 run function retina:get_hitbox/entity/iron_golem

# Leash knots
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_leash_knot retina if entity @s[type=minecraft:leash_knot]
execute if score $entity.is_leash_knot retina matches 1 run function retina:get_hitbox/entity/leash_knot

# Llamas and trader llamas
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_llama retina if entity @s[type=#retina:llamas]
execute if score $entity.is_llama retina matches 1 run function retina:get_hitbox/entity/llama

# Minecarts (with chests, with command blocks, with furnaces, with hoppers, with spawners, with TNT)
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_minecart retina if entity @s[type=#retina:minecarts]
execute if score $entity.is_minecart retina matches 1 run function retina:get_hitbox/entity/minecart

# Pandas
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_panda retina if entity @s[type=minecraft:panda]
execute if score $entity.is_panda retina matches 1 run function retina:get_hitbox/entity/panda

# Phantoms
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_phantom retina if entity @s[type=minecraft:phantom]
execute if score $entity.is_phantom retina matches 1 run function retina:get_hitbox/entity/phantom

# Pigs
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_pig retina if entity @s[type=minecraft:pig]
execute if score $entity.is_pig retina matches 1 run function retina:get_hitbox/entity/pig

# Pufferfish
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_pufferfish retina if entity @s[type=minecraft:pufferfish]
execute if score $entity.is_pufferfish retina matches 1 run function retina:get_hitbox/entity/pufferfish

# Players and blazes
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_player_like retina if entity @s[type=#retina:player_like, predicate=!retina:swimming, predicate=!retina:sneaking]
execute if score $entity.is_player_like retina matches 1 run function retina:get_hitbox/entity/player_like

# Polar bears
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_polar_bear retina if entity @s[type=minecraft:polar_bear]
execute if score $entity.is_polar_bear retina matches 1 run function retina:get_hitbox/entity/polar_bear

# Rabbits
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_rabbit retina if entity @s[type=minecraft:rabbit]
execute if score $entity.is_rabbit retina matches 1 run function retina:get_hitbox/entity/rabbit

# Ravagers
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_ravager retina if entity @s[type=minecraft:ravager]
execute if score $entity.is_ravager retina matches 1 run function retina:get_hitbox/entity/ravager

# Salmons
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_salmon retina if entity @s[type=minecraft:salmon]
execute if score $entity.is_salmon retina matches 1 run function retina:get_hitbox/entity/salmon

# Sheep and goats
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_sheep_like retina if entity @s[type=#retina:sheep_like]
execute if score $entity.is_sheep_like retina matches 1 run function retina:get_hitbox/entity/sheep_like

# Shulkers
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_shulker retina if entity @s[type=minecraft:shulker]
execute if score $entity.is_shulker retina matches 1 run function retina:get_hitbox/entity/shulker

# Skeletons and strays
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_skeleton retina if entity @s[type=#minecraft:skeletons]
execute if score $entity.is_skeleton retina matches 1 run function retina:get_hitbox/entity/skeleton

# Slimes and magma cubes
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_slime_like retina if entity @s[type=#retina:slime_like]
execute if score $entity.is_slime_like retina matches 1 run function retina:get_hitbox/entity/slime_like

# Snow golems
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_snow_golem retina if entity @s[type=minecraft:snow_golem]
execute if score $entity.is_snow_golem retina matches 1 run function retina:get_hitbox/entity/snow_golem

# Striders
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_strider retina if entity @s[type=minecraft:strider]
execute if score $entity.is_strider retina matches 1 run function retina:get_hitbox/entity/strider

# Squids and glow squids
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_squid retina if entity @s[type=#retina:squids]
execute if score $entity.is_squid retina matches 1 run function retina:get_hitbox/entity/squid

# Spiders
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_spider retina if entity @s[type=minecraft:spider]
execute if score $entity.is_spider retina matches 1 run function retina:get_hitbox/entity/spider

# Tropical fish
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_tropical_fish retina if entity @s[type=minecraft:tropical_fish]
execute if score $entity.is_tropical_fish retina matches 1 run function retina:get_hitbox/entity/tropical_fish

# Turtles
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_turtle retina if entity @s[type=minecraft:turtle]
execute if score $entity.is_turtle retina matches 1 run function retina:get_hitbox/entity/turtle

# Vexes
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_vex retina if entity @s[type=minecraft:vex]
execute if score $entity.is_vex retina matches 1 run function retina:get_hitbox/entity/vex

# Withers
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_wither retina if entity @s[type=minecraft:wither]
execute if score $entity.is_wither retina matches 1 run function retina:get_hitbox/entity/wither

# Wither skeletons
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_wither_skeleton retina if entity @s[type=minecraft:wither_skeleton]
execute if score $entity.is_wither_skeleton retina matches 1 run function retina:get_hitbox/entity/wither_skeleton

# Wolves
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_wolf retina if entity @s[type=minecraft:wolf]
execute if score $entity.is_wolf retina matches 1 run function retina:get_hitbox/entity/wolf

# Drowned, evoker, husk, illusioner, piglin, piglin_brute, pillager, villager, vindicator, wandering trader, witch, zombie, zombie villager, zombified piglin
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_zombie_like retina if entity @s[type=#retina:zombie_like, predicate=!retina:swimming]
execute if score $entity.is_zombie_like retina matches 1 run function retina:get_hitbox/entity/zombie_like

# Get the entity's coordinates
scoreboard players operation $save_[x] retina = $[x] retina
scoreboard players operation $save_[y] retina = $[y] retina
scoreboard players operation $save_[z] retina = $[z] retina
scoreboard players operation $save_{x} retina = ${x} retina
scoreboard players operation $save_{y} retina = ${y} retina
scoreboard players operation $save_{z} retina = ${z} retina
scoreboard players operation $save_dx retina = $dx retina
scoreboard players operation $save_dy retina = $dy retina
scoreboard players operation $save_dz retina = $dz retina
execute at @s run function retina:get_coordinates/main
scoreboard players operation $entity_[x] retina = $[x] retina
scoreboard players operation $entity_[y] retina = $[y] retina
scoreboard players operation $entity_[z] retina = $[z] retina
scoreboard players operation $entity_{x} retina = ${x} retina
scoreboard players operation $entity_{y} retina = ${y} retina
scoreboard players operation $entity_{z} retina = ${z} retina
scoreboard players operation $[x] retina = $save_[x] retina
scoreboard players operation $[y] retina = $save_[y] retina
scoreboard players operation $[z] retina = $save_[z] retina
scoreboard players operation ${x} retina = $save_{x} retina
scoreboard players operation ${y} retina = $save_{y} retina
scoreboard players operation ${z} retina = $save_{z} retina
scoreboard players operation $dx retina = $save_dx retina
scoreboard players operation $dy retina = $save_dy retina
scoreboard players operation $dz retina = $save_dz retina

# Save how many blocks away the entity is from the block origin
scoreboard players operation $entity_dx retina = $entity_[x] retina
scoreboard players operation $entity_dx retina -= $[x] retina
scoreboard players operation $entity_dx retina *= $1000000 retina
scoreboard players operation $entity_dx retina += $entity_{x} retina
scoreboard players operation $entity_dy retina = $entity_[y] retina
scoreboard players operation $entity_dy retina -= $[y] retina
scoreboard players operation $entity_dy retina *= $1000000 retina
scoreboard players operation $entity_dy retina += $entity_{y} retina
scoreboard players operation $entity_dz retina = $entity_[z] retina
scoreboard players operation $entity_dz retina -= $[z] retina
scoreboard players operation $entity_dz retina *= $1000000 retina
scoreboard players operation $entity_dz retina += $entity_{z} retina

# Get the coordinates of the bounding box
scoreboard players operation $entity_x0 retina = $entity_dx retina
scoreboard players operation $entity_x0 retina -= $entity_half_width retina
execute if score $entity_x0 retina matches ..0 run scoreboard players set $entity_x0 retina 0
scoreboard players operation $entity_y0 retina = $entity_dy retina
execute if score $entity_y0 retina matches ..0 run scoreboard players set $entity_y0 retina 0
scoreboard players operation $entity_z0 retina = $entity_dz retina
scoreboard players operation $entity_z0 retina -= $entity_half_width retina
execute if score $entity_z0 retina matches ..0 run scoreboard players set $entity_z0 retina 0
scoreboard players operation $entity_x1 retina = $entity_dx retina
scoreboard players operation $entity_x1 retina += $entity_half_width retina
execute if score $entity_x1 retina matches 1000000.. run scoreboard players set $entity_x1 retina 1000000
scoreboard players operation $entity_y1 retina = $entity_dy retina
scoreboard players operation $entity_y1 retina += $entity_height retina
execute if score $entity_y1 retina matches 1000000.. run scoreboard players set $entity_y1 retina 1000000
scoreboard players operation $entity_z1 retina = $entity_dz retina
scoreboard players operation $entity_z1 retina += $entity_half_width retina
execute if score $entity_z1 retina matches 1000000.. run scoreboard players set $entity_z1 retina 1000000

# Store these coordinates to storage
data modify storage retina:data Surfaces.Top append value [0, 0, 0, 0, 0, 0]
data modify storage retina:data Surfaces.Bottom append value [0, 0, 0, 0, 0, 0]
data modify storage retina:data Surfaces.West append value [0, 0, 0, 0, 0, 0]
data modify storage retina:data Surfaces.East append value [0, 0, 0, 0, 0, 0]
data modify storage retina:data Surfaces.North append value [0, 0, 0, 0, 0, 0]
data modify storage retina:data Surfaces.South append value [0, 0, 0, 0, 0, 0]

execute store result storage retina:data Surfaces.Top[-1][0] int 1 run scoreboard players get $entity_x0 retina
execute store result storage retina:data Surfaces.Top[-1][1] int 1 run scoreboard players get $entity_y1 retina
execute store result storage retina:data Surfaces.Top[-1][2] int 1 run scoreboard players get $entity_z0 retina
execute store result storage retina:data Surfaces.Top[-1][3] int 1 run scoreboard players get $entity_x1 retina
execute store result storage retina:data Surfaces.Top[-1][4] int 1 run scoreboard players get $entity_y1 retina
execute store result storage retina:data Surfaces.Top[-1][5] int 1 run scoreboard players get $entity_z1 retina

execute store result storage retina:data Surfaces.Bottom[-1][0] int 1 run scoreboard players get $entity_x0 retina
execute store result storage retina:data Surfaces.Bottom[-1][1] int 1 run scoreboard players get $entity_y0 retina
execute store result storage retina:data Surfaces.Bottom[-1][2] int 1 run scoreboard players get $entity_z0 retina
execute store result storage retina:data Surfaces.Bottom[-1][3] int 1 run scoreboard players get $entity_x1 retina
execute store result storage retina:data Surfaces.Bottom[-1][4] int 1 run scoreboard players get $entity_y0 retina
execute store result storage retina:data Surfaces.Bottom[-1][5] int 1 run scoreboard players get $entity_z1 retina

execute store result storage retina:data Surfaces.West[-1][0] int 1 run scoreboard players get $entity_x0 retina
execute store result storage retina:data Surfaces.West[-1][1] int 1 run scoreboard players get $entity_y0 retina
execute store result storage retina:data Surfaces.West[-1][2] int 1 run scoreboard players get $entity_z0 retina
execute store result storage retina:data Surfaces.West[-1][3] int 1 run scoreboard players get $entity_x0 retina
execute store result storage retina:data Surfaces.West[-1][4] int 1 run scoreboard players get $entity_y1 retina
execute store result storage retina:data Surfaces.West[-1][5] int 1 run scoreboard players get $entity_z1 retina

execute store result storage retina:data Surfaces.East[-1][0] int 1 run scoreboard players get $entity_x1 retina
execute store result storage retina:data Surfaces.East[-1][1] int 1 run scoreboard players get $entity_y0 retina
execute store result storage retina:data Surfaces.East[-1][2] int 1 run scoreboard players get $entity_z0 retina
execute store result storage retina:data Surfaces.East[-1][3] int 1 run scoreboard players get $entity_x1 retina
execute store result storage retina:data Surfaces.East[-1][4] int 1 run scoreboard players get $entity_y1 retina
execute store result storage retina:data Surfaces.East[-1][5] int 1 run scoreboard players get $entity_z1 retina

execute store result storage retina:data Surfaces.North[-1][0] int 1 run scoreboard players get $entity_x0 retina
execute store result storage retina:data Surfaces.North[-1][1] int 1 run scoreboard players get $entity_y0 retina
execute store result storage retina:data Surfaces.North[-1][2] int 1 run scoreboard players get $entity_z0 retina
execute store result storage retina:data Surfaces.North[-1][3] int 1 run scoreboard players get $entity_x1 retina
execute store result storage retina:data Surfaces.North[-1][4] int 1 run scoreboard players get $entity_y1 retina
execute store result storage retina:data Surfaces.North[-1][5] int 1 run scoreboard players get $entity_z0 retina

execute store result storage retina:data Surfaces.South[-1][0] int 1 run scoreboard players get $entity_x0 retina
execute store result storage retina:data Surfaces.South[-1][1] int 1 run scoreboard players get $entity_y0 retina
execute store result storage retina:data Surfaces.South[-1][2] int 1 run scoreboard players get $entity_z1 retina
execute store result storage retina:data Surfaces.South[-1][3] int 1 run scoreboard players get $entity_x1 retina
execute store result storage retina:data Surfaces.South[-1][4] int 1 run scoreboard players get $entity_y1 retina
execute store result storage retina:data Surfaces.South[-1][5] int 1 run scoreboard players get $entity_z1 retina

# Special case for item frames and paintings which are annoying
execute if score $entity_found retina matches 0 store success score $entity_found retina store success score $entity.is_item_frame retina if entity @s[type=#retina:item_frames]
execute if score $entity.is_item_frame retina matches 1 run function retina:get_hitbox/entity/item_frame

# Give this entity a tag and an ID
tag @s add retina.possible_target
scoreboard players operation @s retina.id = $max retina.id
scoreboard players add $max retina.id 1