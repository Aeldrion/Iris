#> iris:get_hitbox/entity
#
# Returns a list of surfaces of the executing entity
#
# @within iris:raycast/on_entity_found
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

execute store result score $entity.is_zombie_like iris store result score $entity.is_baby_zombie_like iris store result score $entity.is_cow iris store result score $entity.is_baby_cow iris store result score $entity.is_player_like iris store result score $entity.is_horse iris run scoreboard players set $entity_found iris 0

# Armour stands
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_armor_stand iris if entity @s[type=minecraft:armor_stand]
execute if score $entity.is_armor_stand iris matches 1 run function iris:get_hitbox/entity/armor_stand

# Axolotls
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_axolotl iris if entity @s[type=minecraft:axolotl]
execute if score $entity.is_axolotl iris matches 1 run function iris:get_hitbox/entity/axolotl

# Bats, parrots
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_bat_like iris if entity @s[type=#iris:bat_like]
execute if score $entity.is_bat_like iris matches 1 run function iris:get_hitbox/entity/bat_like

# Bees
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_bee iris if entity @s[type=minecraft:bee]
execute if score $entity.is_bee iris matches 1 run function iris:get_hitbox/entity/bee

# Boats
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_boat iris if entity @s[type=minecraft:boat]
execute if score $entity.is_boat iris matches 1 run function iris:get_hitbox/entity/boat

# Cats, foxes, ocelots
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_cat_like iris if entity @s[type=#iris:cat_like]
execute if score $entity.is_cat_like iris matches 1 run function iris:get_hitbox/entity/cat_like

# Cave spiders
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_cave_spider iris if entity @s[type=minecraft:cave_spider]
execute if score $entity.is_cave_spider iris matches 1 run function iris:get_hitbox/entity/cave_spider

# Chickens
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_chicken iris if entity @s[type=minecraft:chicken]
execute if score $entity.is_chicken iris matches 1 run function iris:get_hitbox/entity/chicken

# Cods
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_cod iris if entity @s[type=minecraft:cod]
execute if score $entity.is_cod iris matches 1 run function iris:get_hitbox/entity/cod

# Cows and mooshrooms
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_cow iris if entity @s[type=#iris:cows]
execute if score $entity.is_cow iris matches 1 run function iris:get_hitbox/entity/cow

# Creepers
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_creeper iris if entity @s[type=minecraft:creeper]
execute if score $entity.is_creeper iris matches 1 run function iris:get_hitbox/entity/creeper

# Dolphins
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_dolphin iris if entity @s[type=minecraft:dolphin]
execute if score $entity.is_dolphin iris matches 1 run function iris:get_hitbox/entity/dolphin

# Donkeys
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_donkey iris if entity @s[type=minecraft:donkey]
execute if score $entity.is_donkey iris matches 1 run function iris:get_hitbox/entity/donkey

# Elder guardians
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_elder_guardian iris if entity @s[type=minecraft:elder_guardian]
execute if score $entity.is_elder_guardian iris matches 1 run function iris:get_hitbox/entity/elder_guardian

# End crystals
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_end_crystal iris if entity @s[type=minecraft:end_crystal]
execute if score $entity.is_end_crystal iris matches 1 run function iris:get_hitbox/entity/end_crystal

# Endermen
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_enderman iris if entity @s[type=minecraft:enderman]
execute if score $entity.is_enderman iris matches 1 run function iris:get_hitbox/entity/enderman

# Endermites and silverfish
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_endermite_like iris if entity @s[type=#iris:endermite_like]
execute if score $entity.is_endermite_like iris matches 1 run function iris:get_hitbox/entity/endermite_like

# Falling blocks and primed TNT
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_falling_block_like iris if entity @s[type=#iris:falling_block_like]
execute if score $entity.is_falling_block_like iris matches 1 run function iris:get_hitbox/entity/falling_block_like

# Ghasts
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_ghast iris if entity @s[type=minecraft:ghast]
execute if score $entity.is_ghast iris matches 1 run function iris:get_hitbox/entity/ghast

# Giants
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_giant iris if entity @s[type=minecraft:giant]
execute if score $entity.is_giant iris matches 1 run function iris:get_hitbox/entity/giant

# Guardians
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_guardian iris if entity @s[type=minecraft:guardian]
execute if score $entity.is_guardian iris matches 1 run function iris:get_hitbox/entity/guardian

# Hoglins and zoglins
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_hoglin iris if entity @s[type=#iris:hoglins]
execute if score $entity.is_hoglin iris matches 1 run function iris:get_hitbox/entity/hoglin

# Horses and mules
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_horse iris if entity @s[type=#iris:horses]
execute if score $entity.is_horse iris matches 1 run function iris:get_hitbox/entity/horse

# Iron golems
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_iron_golem iris if entity @s[type=minecraft:iron_golem]
execute if score $entity.is_iron_golem iris matches 1 run function iris:get_hitbox/entity/iron_golem

# Leash knots
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_leash_knot iris if entity @s[type=minecraft:leash_knot]
execute if score $entity.is_leash_knot iris matches 1 run function iris:get_hitbox/entity/leash_knot

# Llamas and trader llamas
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_llama iris if entity @s[type=#iris:llamas]
execute if score $entity.is_llama iris matches 1 run function iris:get_hitbox/entity/llama

# Minecarts (with chests, with command blocks, with furnaces, with hoppers, with spawners, with TNT)
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_minecart iris if entity @s[type=#iris:minecarts]
execute if score $entity.is_minecart iris matches 1 run function iris:get_hitbox/entity/minecart

# Pandas
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_panda iris if entity @s[type=minecraft:panda]
execute if score $entity.is_panda iris matches 1 run function iris:get_hitbox/entity/panda

# Phantoms
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_phantom iris if entity @s[type=minecraft:phantom]
execute if score $entity.is_phantom iris matches 1 run function iris:get_hitbox/entity/phantom

# Pigs
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_pig iris if entity @s[type=minecraft:pig]
execute if score $entity.is_pig iris matches 1 run function iris:get_hitbox/entity/pig

# Pufferfish
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_pufferfish iris if entity @s[type=minecraft:pufferfish]
execute if score $entity.is_pufferfish iris matches 1 run function iris:get_hitbox/entity/pufferfish

# Players and blazes
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_player_like iris if entity @s[type=#iris:player_like, predicate=!iris:swimming, predicate=!iris:sneaking]
execute if score $entity.is_player_like iris matches 1 run function iris:get_hitbox/entity/player_like

# Polar bears
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_polar_bear iris if entity @s[type=minecraft:polar_bear]
execute if score $entity.is_polar_bear iris matches 1 run function iris:get_hitbox/entity/polar_bear

# Rabbits
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_rabbit iris if entity @s[type=minecraft:rabbit]
execute if score $entity.is_rabbit iris matches 1 run function iris:get_hitbox/entity/rabbit

# Ravagers
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_ravager iris if entity @s[type=minecraft:ravager]
execute if score $entity.is_ravager iris matches 1 run function iris:get_hitbox/entity/ravager

# Salmons
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_salmon iris if entity @s[type=minecraft:salmon]
execute if score $entity.is_salmon iris matches 1 run function iris:get_hitbox/entity/salmon

# Sheep and goats
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_sheep_like iris if entity @s[type=#iris:sheep_like]
execute if score $entity.is_sheep_like iris matches 1 run function iris:get_hitbox/entity/sheep_like

# Shulkers
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_shulker iris if entity @s[type=minecraft:shulker]
execute if score $entity.is_shulker iris matches 1 run function iris:get_hitbox/entity/shulker

# Skeletons and strays
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_skeleton iris if entity @s[type=#minecraft:skeletons]
execute if score $entity.is_skeleton iris matches 1 run function iris:get_hitbox/entity/skeleton

# Slimes and magma cubes
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_slime_like iris if entity @s[type=#iris:slime_like]
execute if score $entity.is_slime_like iris matches 1 run function iris:get_hitbox/entity/slime_like

# Snow golems
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_snow_golem iris if entity @s[type=minecraft:snow_golem]
execute if score $entity.is_snow_golem iris matches 1 run function iris:get_hitbox/entity/snow_golem

# Striders
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_strider iris if entity @s[type=minecraft:strider]
execute if score $entity.is_strider iris matches 1 run function iris:get_hitbox/entity/strider

# Squids and glow squids
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_squid iris if entity @s[type=#iris:squids]
execute if score $entity.is_squid iris matches 1 run function iris:get_hitbox/entity/squid

# Spiders
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_spider iris if entity @s[type=minecraft:spider]
execute if score $entity.is_spider iris matches 1 run function iris:get_hitbox/entity/spider

# Tropical fish
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_tropical_fish iris if entity @s[type=minecraft:tropical_fish]
execute if score $entity.is_tropical_fish iris matches 1 run function iris:get_hitbox/entity/tropical_fish

# Turtles
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_turtle iris if entity @s[type=minecraft:turtle]
execute if score $entity.is_turtle iris matches 1 run function iris:get_hitbox/entity/turtle

# Vexes
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_vex iris if entity @s[type=minecraft:vex]
execute if score $entity.is_vex iris matches 1 run function iris:get_hitbox/entity/vex

# Withers
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_wither iris if entity @s[type=minecraft:wither]
execute if score $entity.is_wither iris matches 1 run function iris:get_hitbox/entity/wither

# Wither skeletons
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_wither_skeleton iris if entity @s[type=minecraft:wither_skeleton]
execute if score $entity.is_wither_skeleton iris matches 1 run function iris:get_hitbox/entity/wither_skeleton

# Wolves
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_wolf iris if entity @s[type=minecraft:wolf]
execute if score $entity.is_wolf iris matches 1 run function iris:get_hitbox/entity/wolf

# Drowned, evoker, husk, illusioner, piglin, piglin_brute, pillager, villager, vindicator, wandering trader, witch, zombie, zombie villager, zombified piglin
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_zombie_like iris if entity @s[type=#iris:zombie_like, predicate=!iris:swimming]
execute if score $entity.is_zombie_like iris matches 1 run function iris:get_hitbox/entity/zombie_like

# Get the entity's coordinates
scoreboard players operation $save_[x] iris = $[x] iris
scoreboard players operation $save_[y] iris = $[y] iris
scoreboard players operation $save_[z] iris = $[z] iris
scoreboard players operation $save_{x} iris = ${x} iris
scoreboard players operation $save_{y} iris = ${y} iris
scoreboard players operation $save_{z} iris = ${z} iris
scoreboard players operation $save_dx iris = $dx iris
scoreboard players operation $save_dy iris = $dy iris
scoreboard players operation $save_dz iris = $dz iris
execute at @s run function iris:get_coordinates/main
scoreboard players operation $entity_[x] iris = $[x] iris
scoreboard players operation $entity_[y] iris = $[y] iris
scoreboard players operation $entity_[z] iris = $[z] iris
scoreboard players operation $entity_{x} iris = ${x} iris
scoreboard players operation $entity_{y} iris = ${y} iris
scoreboard players operation $entity_{z} iris = ${z} iris
scoreboard players operation $[x] iris = $save_[x] iris
scoreboard players operation $[y] iris = $save_[y] iris
scoreboard players operation $[z] iris = $save_[z] iris
scoreboard players operation ${x} iris = $save_{x} iris
scoreboard players operation ${y} iris = $save_{y} iris
scoreboard players operation ${z} iris = $save_{z} iris
scoreboard players operation $dx iris = $save_dx iris
scoreboard players operation $dy iris = $save_dy iris
scoreboard players operation $dz iris = $save_dz iris

# Save how many blocks away the entity is from the block origin
scoreboard players operation $entity_dx iris = $entity_[x] iris
scoreboard players operation $entity_dx iris -= $[x] iris
scoreboard players operation $entity_dx iris *= $1000000 iris
scoreboard players operation $entity_dx iris += $entity_{x} iris
scoreboard players operation $entity_dy iris = $entity_[y] iris
scoreboard players operation $entity_dy iris -= $[y] iris
scoreboard players operation $entity_dy iris *= $1000000 iris
scoreboard players operation $entity_dy iris += $entity_{y} iris
scoreboard players operation $entity_dz iris = $entity_[z] iris
scoreboard players operation $entity_dz iris -= $[z] iris
scoreboard players operation $entity_dz iris *= $1000000 iris
scoreboard players operation $entity_dz iris += $entity_{z} iris

# Get the coordinates of the bounding box
scoreboard players operation $entity_x0 iris = $entity_dx iris
scoreboard players operation $entity_x0 iris -= $entity_half_width iris
execute if score $entity_x0 iris matches ..0 run scoreboard players set $entity_x0 iris 0
scoreboard players operation $entity_y0 iris = $entity_dy iris
execute if score $entity_y0 iris matches ..0 run scoreboard players set $entity_y0 iris 0
scoreboard players operation $entity_z0 iris = $entity_dz iris
scoreboard players operation $entity_z0 iris -= $entity_half_width iris
execute if score $entity_z0 iris matches ..0 run scoreboard players set $entity_z0 iris 0
scoreboard players operation $entity_x1 iris = $entity_dx iris
scoreboard players operation $entity_x1 iris += $entity_half_width iris
execute if score $entity_x1 iris matches 1000000.. run scoreboard players set $entity_x1 iris 1000000
scoreboard players operation $entity_y1 iris = $entity_dy iris
scoreboard players operation $entity_y1 iris += $entity_height iris
execute if score $entity_y1 iris matches 1000000.. run scoreboard players set $entity_y1 iris 1000000
scoreboard players operation $entity_z1 iris = $entity_dz iris
scoreboard players operation $entity_z1 iris += $entity_half_width iris
execute if score $entity_z1 iris matches 1000000.. run scoreboard players set $entity_z1 iris 1000000

# Store these coordinates to storage
data modify storage iris:data Surfaces.Top append value [0, 0, 0, 0, 0, 0]
data modify storage iris:data Surfaces.Bottom append value [0, 0, 0, 0, 0, 0]
data modify storage iris:data Surfaces.West append value [0, 0, 0, 0, 0, 0]
data modify storage iris:data Surfaces.East append value [0, 0, 0, 0, 0, 0]
data modify storage iris:data Surfaces.North append value [0, 0, 0, 0, 0, 0]
data modify storage iris:data Surfaces.South append value [0, 0, 0, 0, 0, 0]

execute store result storage iris:data Surfaces.Top[-1][0] int 1 run scoreboard players get $entity_x0 iris
execute store result storage iris:data Surfaces.Top[-1][1] int 1 run scoreboard players get $entity_y1 iris
execute store result storage iris:data Surfaces.Top[-1][2] int 1 run scoreboard players get $entity_z0 iris
execute store result storage iris:data Surfaces.Top[-1][3] int 1 run scoreboard players get $entity_x1 iris
execute store result storage iris:data Surfaces.Top[-1][4] int 1 run scoreboard players get $entity_y1 iris
execute store result storage iris:data Surfaces.Top[-1][5] int 1 run scoreboard players get $entity_z1 iris

execute store result storage iris:data Surfaces.Bottom[-1][0] int 1 run scoreboard players get $entity_x0 iris
execute store result storage iris:data Surfaces.Bottom[-1][1] int 1 run scoreboard players get $entity_y0 iris
execute store result storage iris:data Surfaces.Bottom[-1][2] int 1 run scoreboard players get $entity_z0 iris
execute store result storage iris:data Surfaces.Bottom[-1][3] int 1 run scoreboard players get $entity_x1 iris
execute store result storage iris:data Surfaces.Bottom[-1][4] int 1 run scoreboard players get $entity_y0 iris
execute store result storage iris:data Surfaces.Bottom[-1][5] int 1 run scoreboard players get $entity_z1 iris

execute store result storage iris:data Surfaces.West[-1][0] int 1 run scoreboard players get $entity_x0 iris
execute store result storage iris:data Surfaces.West[-1][1] int 1 run scoreboard players get $entity_y0 iris
execute store result storage iris:data Surfaces.West[-1][2] int 1 run scoreboard players get $entity_z0 iris
execute store result storage iris:data Surfaces.West[-1][3] int 1 run scoreboard players get $entity_x0 iris
execute store result storage iris:data Surfaces.West[-1][4] int 1 run scoreboard players get $entity_y1 iris
execute store result storage iris:data Surfaces.West[-1][5] int 1 run scoreboard players get $entity_z1 iris

execute store result storage iris:data Surfaces.East[-1][0] int 1 run scoreboard players get $entity_x1 iris
execute store result storage iris:data Surfaces.East[-1][1] int 1 run scoreboard players get $entity_y0 iris
execute store result storage iris:data Surfaces.East[-1][2] int 1 run scoreboard players get $entity_z0 iris
execute store result storage iris:data Surfaces.East[-1][3] int 1 run scoreboard players get $entity_x1 iris
execute store result storage iris:data Surfaces.East[-1][4] int 1 run scoreboard players get $entity_y1 iris
execute store result storage iris:data Surfaces.East[-1][5] int 1 run scoreboard players get $entity_z1 iris

execute store result storage iris:data Surfaces.North[-1][0] int 1 run scoreboard players get $entity_x0 iris
execute store result storage iris:data Surfaces.North[-1][1] int 1 run scoreboard players get $entity_y0 iris
execute store result storage iris:data Surfaces.North[-1][2] int 1 run scoreboard players get $entity_z0 iris
execute store result storage iris:data Surfaces.North[-1][3] int 1 run scoreboard players get $entity_x1 iris
execute store result storage iris:data Surfaces.North[-1][4] int 1 run scoreboard players get $entity_y1 iris
execute store result storage iris:data Surfaces.North[-1][5] int 1 run scoreboard players get $entity_z0 iris

execute store result storage iris:data Surfaces.South[-1][0] int 1 run scoreboard players get $entity_x0 iris
execute store result storage iris:data Surfaces.South[-1][1] int 1 run scoreboard players get $entity_y0 iris
execute store result storage iris:data Surfaces.South[-1][2] int 1 run scoreboard players get $entity_z1 iris
execute store result storage iris:data Surfaces.South[-1][3] int 1 run scoreboard players get $entity_x1 iris
execute store result storage iris:data Surfaces.South[-1][4] int 1 run scoreboard players get $entity_y1 iris
execute store result storage iris:data Surfaces.South[-1][5] int 1 run scoreboard players get $entity_z1 iris

# Special case for item frames and paintings which are annoying
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_item_frame iris if entity @s[type=#iris:item_frames]
execute if score $entity.is_item_frame iris matches 1 run function iris:get_hitbox/entity/item_frame

# Give this entity a tag and an ID
tag @s add iris.possible_target
scoreboard players operation @s iris.id = $max iris.id
scoreboard players add $max iris.id 1