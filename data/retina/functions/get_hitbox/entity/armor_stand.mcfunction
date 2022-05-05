#> retina:get_hitbox/entity/armor_stand
#
# @within retina:get_hitbox/entity

data modify storage retina:data EntityTag set from entity @s
execute if data storage retina:data EntityTag{Small: 1b} run scoreboard players set $entity_half_width retina 125000
execute if data storage retina:data EntityTag{Small: 1b} run scoreboard players set $entity_height retina 987500
execute unless data storage retina:data EntityTag{Small: 1b} run scoreboard players set $entity_half_width retina 250000
execute unless data storage retina:data EntityTag{Small: 1b} run scoreboard players set $entity_height retina 1975000
execute if data storage retina:data EntityTag{Marker: 1b} store result score $entity_half_width retina run scoreboard players set $entity_height retina 0