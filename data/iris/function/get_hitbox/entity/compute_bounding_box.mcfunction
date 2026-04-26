#> iris:get_hitbox/entity/compute_bounding_box
#
# @reads
#   score $entity_width iris
#   score $entity_height iris
#       The size of the entity's hitbox, in millionths of a block
#   score $entity_dx iris
#   score $entity_dy iris
#   score $entity_dz iris
#       The position of the entity relative to the origin of the current block, in millionths of a block
# @within iris:get_hitbox/entity

scoreboard players operation $entity_half_width iris = $entity_width iris
scoreboard players operation $entity_half_width iris /= $2 iris
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

# Store to storage
data modify storage iris:data shape append value {type: "ENTITY", min: [0.0, 0.0, 0.0], max: [0.0, 0.0, 0.0]}
execute store result storage iris:data shape[-1].min[0] double 0.000001 run scoreboard players get $entity_x0 iris
execute store result storage iris:data shape[-1].min[1] double 0.000001 run scoreboard players get $entity_y0 iris
execute store result storage iris:data shape[-1].min[2] double 0.000001 run scoreboard players get $entity_z0 iris
execute store result storage iris:data shape[-1].max[0] double 0.000001 run scoreboard players get $entity_x1 iris
execute store result storage iris:data shape[-1].max[1] double 0.000001 run scoreboard players get $entity_y1 iris
execute store result storage iris:data shape[-1].max[2] double 0.000001 run scoreboard players get $entity_z1 iris
