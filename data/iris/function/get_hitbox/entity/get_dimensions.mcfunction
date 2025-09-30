#> iris:get_hitbox/entity/get_dimensions
#
# Gets the size of the hitbox of the current entity
#
# @within iris:get_hitbox/entity
# @writes
#   score $entity_height iris
#       The height of the hitbox, in millionths of a block
#   score $entity_width iris
#       The width of the hitbox, in millionths of a block

# Get entity dimensions
scoreboard players set $entity_found iris 0
execute if score $entity_found iris matches 0 if entity @s[type=#iris:tree/0] run function iris:get_hitbox/entity/tree/0
execute if score $entity_found iris matches 0 if entity @s[type=#iris:tree/1] run function iris:get_hitbox/entity/tree/1
execute if score $entity_found iris matches 0 if entity @s[type=#iris:tree/2] run function iris:get_hitbox/entity/tree/2
execute if score $entity_found iris matches 0 if entity @s[type=#iris:tree/3] run function iris:get_hitbox/entity/tree/3
execute if score $entity_found iris matches 0 if entity @s[type=#iris:tree/4] run function iris:get_hitbox/entity/tree/4

# Scale
function iris:get_hitbox/entity/scale
execute if predicate iris:baby run scoreboard players operation $entity_width iris /= $2 iris
execute if predicate iris:baby run scoreboard players operation $entity_height iris /= $2 iris
