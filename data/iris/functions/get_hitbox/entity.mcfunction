#> iris:get_hitbox/entity
#
# Returns a list of surfaces of the executing entity
#
# @within iris:raycast/test_for_entity
# @writes
#   storage iris:data
#       Surfaces: int[][]
#           A list of potential surfaces for which to test intersections.
#           Every surface is written as six coordinates, from one corner to the other. For example, the bottom of a shulker can be described as
#           [0, 0, 0, 1000000, 0, 1000000]

execute if score $entity_found iris matches 0 if entity @s[type=#iris:tree/0] run function iris:get_hitbox/entity/tree/0
execute if score $entity_found iris matches 0 if entity @s[type=#iris:tree/1] run function iris:get_hitbox/entity/tree/1
execute if score $entity_found iris matches 0 if entity @s[type=#iris:tree/2] run function iris:get_hitbox/entity/tree/2
execute if score $entity_found iris matches 0 if entity @s[type=#iris:tree/3] run function iris:get_hitbox/entity/tree/3
execute if score $entity_found iris matches 0 if entity @s[type=#iris:tree/4] run function iris:get_hitbox/entity/tree/4

# Get the entity's coordinates
scoreboard players operation $entity_[x] iris = $[x] iris
scoreboard players operation $entity_[y] iris = $[y] iris
scoreboard players operation $entity_[z] iris = $[z] iris
scoreboard players operation $entity_{x} iris = ${x} iris
scoreboard players operation $entity_{y} iris = ${y} iris
scoreboard players operation $entity_{z} iris = ${z} iris
scoreboard players operation $save_dx iris = $dx iris
scoreboard players operation $save_dy iris = $dy iris
scoreboard players operation $save_dz iris = $dz iris
execute at @s run function iris:get_coordinates/main
scoreboard players operation $entity_[x] iris >< $[x] iris
scoreboard players operation $entity_[y] iris >< $[y] iris
scoreboard players operation $entity_[z] iris >< $[z] iris
scoreboard players operation $entity_{x} iris >< ${x} iris
scoreboard players operation $entity_{y} iris >< ${y} iris
scoreboard players operation $entity_{z} iris >< ${z} iris
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
data modify storage iris:data Shape append value {type: "ENTITY"}
execute store result storage iris:data Shape[-1].min[0] float 0.000001 run scoreboard players get $entity_x0 iris
execute store result storage iris:data Shape[-1].min[1] float 0.000001 run scoreboard players get $entity_y0 iris
execute store result storage iris:data Shape[-1].min[2] float 0.000001 run scoreboard players get $entity_z0 iris
execute store result storage iris:data Shape[-1].max[0] float 0.000001 run scoreboard players get $entity_x1 iris
execute store result storage iris:data Shape[-1].max[1] float 0.000001 run scoreboard players get $entity_y1 iris
execute store result storage iris:data Shape[-1].max[2] float 0.000001 run scoreboard players get $entity_z1 iris

# Special case for item frames and paintings which are annoying
execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_item_frame iris if entity @s[type=#iris:item_frames]
execute if score $entity.is_item_frame iris matches 1 run function iris:get_hitbox/entity/item_frame

# Give this entity a tag and an ID, and store the ID in the hitbox
tag @s add iris.possible_target
scoreboard players operation @s iris.id = $max_entity_id iris.id
execute store result storage iris:data Shape[-1].entity_id int 1 run scoreboard players get @s iris.id
scoreboard players add $max_entity_id iris.id 1
