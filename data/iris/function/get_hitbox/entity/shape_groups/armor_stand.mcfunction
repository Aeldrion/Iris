data modify storage iris:data EntityTag set from entity @s
execute if data storage iris:data EntityTag{Small: 1b} run scoreboard players set $entity_width iris 250000
execute if data storage iris:data EntityTag{Small: 1b} run scoreboard players set $entity_height iris 987500
execute unless data storage iris:data EntityTag{Small: 1b} run scoreboard players set $entity_width iris 500000
execute unless data storage iris:data EntityTag{Small: 1b} run scoreboard players set $entity_height iris 1975000
execute if data storage iris:data EntityTag{Marker: 1b} store result score $entity_width iris run scoreboard players set $entity_height iris 0