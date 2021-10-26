#> iris:get_hitbox/entity/armor_stand
#
# @within iris:get_hitbox/entity

data modify storage iris:data EntityTag set from entity @s
execute if data storage iris:data EntityTag{Small: 1b} run scoreboard players set $entity_half_width iris 125000
execute if data storage iris:data EntityTag{Small: 1b} run scoreboard players set $entity_height iris 987500
execute unless data storage iris:data EntityTag{Small: 1b} run scoreboard players set $entity_half_width iris 250000
execute unless data storage iris:data EntityTag{Small: 1b} run scoreboard players set $entity_height iris 1975000
execute if data storage iris:data EntityTag{Marker: 1b} store result score $entity_half_width iris run scoreboard players set $entity_height iris 0