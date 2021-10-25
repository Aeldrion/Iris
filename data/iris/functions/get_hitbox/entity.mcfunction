#> iris:get_hitbox/entity
#
# Returns a list of surfaces of the executing entity
#
# @within iris:raycast/on_entity_found
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

execute store result score $entity.is_zombie_like iris store result score $entity.is_baby_zombie_like iris store result score $entity.is_cow iris store result score $entity.is_baby_cow iris store result score $entity.is_player_like iris store result score $entity.is_horse iris run scoreboard players set $entity_found iris 0

# Drowned, evoker, husk, illusioner, piglin, piglin_brute, pillager, villager, vindicator, wandering trader, witch, zombie, zombie villager, zombified piglin
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_zombie_like iris if entity @s[type=#iris:zombie_like, predicate=!iris:baby, predicate=!iris:swimming]
execute if score $entity.is_zombie_like iris matches 1 run function iris:get_hitbox/entity/zombie_like

# Baby drowneds, husks, piglins, villagers, zombies, zombie villagers and zombified piglins
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_baby_zombie_like iris if entity @s[type=#iris:zombie_like, predicate=iris:baby]
execute if score $entity.is_baby_zombie_like iris matches 1 run function iris:get_hitbox/entity/baby_zombie_like

# Cows and mooshrooms
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_cow iris if entity @s[type=#iris:cows, predicate=!iris:baby]
execute if score $entity.is_cow iris matches 1 run function iris:get_hitbox/entity/cow

# Baby cows and mooshrooms
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_baby_cow iris if entity @s[type=#iris:cows, predicate=iris:baby]
execute if score $entity.is_baby_cow iris matches 1 run function iris:get_hitbox/entity/baby_cow

# Players and blazes
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_player_like iris if entity @s[type=#iris:player_like, predicate=!iris:swimming, predicate=!iris:sneaking]
execute if score $entity.is_player_like iris matches 1 run function iris:get_hitbox/entity/player_like

# Horses and mules
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_horse iris if entity @s[type=#iris:horses, predicate=!iris:baby]
execute if score $entity.is_horse iris matches 1 run function iris:get_hitbox/entity/horse

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
data modify storage iris:entity Surfaces.Top append value [0, 0, 0, 0, 0, 0]
data modify storage iris:entity Surfaces.Bottom append value [0, 0, 0, 0, 0, 0]
data modify storage iris:entity Surfaces.West append value [0, 0, 0, 0, 0, 0]
data modify storage iris:entity Surfaces.East append value [0, 0, 0, 0, 0, 0]
data modify storage iris:entity Surfaces.North append value [0, 0, 0, 0, 0, 0]
data modify storage iris:entity Surfaces.South append value [0, 0, 0, 0, 0, 0]

execute store result storage iris:entity Surfaces.Top[-1][0] int 1 run scoreboard players get $entity_x0 iris
execute store result storage iris:entity Surfaces.Top[-1][1] int 1 run scoreboard players get $entity_y1 iris
execute store result storage iris:entity Surfaces.Top[-1][2] int 1 run scoreboard players get $entity_z0 iris
execute store result storage iris:entity Surfaces.Top[-1][3] int 1 run scoreboard players get $entity_x1 iris
execute store result storage iris:entity Surfaces.Top[-1][4] int 1 run scoreboard players get $entity_y1 iris
execute store result storage iris:entity Surfaces.Top[-1][5] int 1 run scoreboard players get $entity_z1 iris

execute store result storage iris:entity Surfaces.Bottom[-1][0] int 1 run scoreboard players get $entity_x0 iris
execute store result storage iris:entity Surfaces.Bottom[-1][1] int 1 run scoreboard players get $entity_y0 iris
execute store result storage iris:entity Surfaces.Bottom[-1][2] int 1 run scoreboard players get $entity_z0 iris
execute store result storage iris:entity Surfaces.Bottom[-1][3] int 1 run scoreboard players get $entity_x1 iris
execute store result storage iris:entity Surfaces.Bottom[-1][4] int 1 run scoreboard players get $entity_y0 iris
execute store result storage iris:entity Surfaces.Bottom[-1][5] int 1 run scoreboard players get $entity_z1 iris

execute store result storage iris:entity Surfaces.West[-1][0] int 1 run scoreboard players get $entity_x0 iris
execute store result storage iris:entity Surfaces.West[-1][1] int 1 run scoreboard players get $entity_y0 iris
execute store result storage iris:entity Surfaces.West[-1][2] int 1 run scoreboard players get $entity_z0 iris
execute store result storage iris:entity Surfaces.West[-1][3] int 1 run scoreboard players get $entity_x0 iris
execute store result storage iris:entity Surfaces.West[-1][4] int 1 run scoreboard players get $entity_y1 iris
execute store result storage iris:entity Surfaces.West[-1][5] int 1 run scoreboard players get $entity_z1 iris

execute store result storage iris:entity Surfaces.East[-1][0] int 1 run scoreboard players get $entity_x1 iris
execute store result storage iris:entity Surfaces.East[-1][1] int 1 run scoreboard players get $entity_y0 iris
execute store result storage iris:entity Surfaces.East[-1][2] int 1 run scoreboard players get $entity_z0 iris
execute store result storage iris:entity Surfaces.East[-1][3] int 1 run scoreboard players get $entity_x1 iris
execute store result storage iris:entity Surfaces.East[-1][4] int 1 run scoreboard players get $entity_y1 iris
execute store result storage iris:entity Surfaces.East[-1][5] int 1 run scoreboard players get $entity_z1 iris

execute store result storage iris:entity Surfaces.North[-1][0] int 1 run scoreboard players get $entity_x0 iris
execute store result storage iris:entity Surfaces.North[-1][1] int 1 run scoreboard players get $entity_y0 iris
execute store result storage iris:entity Surfaces.North[-1][2] int 1 run scoreboard players get $entity_z0 iris
execute store result storage iris:entity Surfaces.North[-1][3] int 1 run scoreboard players get $entity_x1 iris
execute store result storage iris:entity Surfaces.North[-1][4] int 1 run scoreboard players get $entity_y1 iris
execute store result storage iris:entity Surfaces.North[-1][5] int 1 run scoreboard players get $entity_z0 iris

execute store result storage iris:entity Surfaces.South[-1][0] int 1 run scoreboard players get $entity_x0 iris
execute store result storage iris:entity Surfaces.South[-1][1] int 1 run scoreboard players get $entity_y0 iris
execute store result storage iris:entity Surfaces.South[-1][2] int 1 run scoreboard players get $entity_z1 iris
execute store result storage iris:entity Surfaces.South[-1][3] int 1 run scoreboard players get $entity_x1 iris
execute store result storage iris:entity Surfaces.South[-1][4] int 1 run scoreboard players get $entity_y1 iris
execute store result storage iris:entity Surfaces.South[-1][5] int 1 run scoreboard players get $entity_z1 iris

# Give this entity a tag and an ID
tag @s add iris.possible_target
scoreboard players operation @s iris.id = $max iris.id
scoreboard players add $max iris.id 1