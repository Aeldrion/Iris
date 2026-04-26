scoreboard players set $entity_width iris 500000
scoreboard players set $entity_height iris 1975000
execute if entity @s[nbt={Marker: true}] store result score $entity_width iris run scoreboard players set $entity_height iris 0
