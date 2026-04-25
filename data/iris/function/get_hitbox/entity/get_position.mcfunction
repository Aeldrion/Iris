#> iris:get_hitbox/entity/get_position
#
# Gets the entity's coordinates relative to the current block origin
#
# @within iris:get_hitbox/entity
# @writes
#   score $entity_dx iris
#   score $entity_dy iris
#   score $entity_dz iris

# Get the entity's coordinates, but don't override scores
scoreboard players operation $entity_[x] iris = $[x] iris
scoreboard players operation $entity_[y] iris = $[y] iris
scoreboard players operation $entity_[z] iris = $[z] iris
scoreboard players operation $entity_{x} iris = ${x} iris
scoreboard players operation $entity_{y} iris = ${y} iris
scoreboard players operation $entity_{z} iris = ${z} iris
execute at @s summon minecraft:marker run function iris:get_position/get_coordinates
scoreboard players operation $entity_[x] iris >< $[x] iris
scoreboard players operation $entity_[y] iris >< $[y] iris
scoreboard players operation $entity_[z] iris >< $[z] iris
scoreboard players operation $entity_{x} iris >< ${x} iris
scoreboard players operation $entity_{y} iris >< ${y} iris
scoreboard players operation $entity_{z} iris >< ${z} iris

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
