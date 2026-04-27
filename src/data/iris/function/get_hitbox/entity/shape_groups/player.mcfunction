scoreboard players set $entity_width iris 600000
scoreboard players set $entity_height iris 1800000

# Adjust if the player is swimming, sneaking, or gliding
execute if predicate iris:swimming run return run scoreboard players set $entity_height iris 600000
execute if predicate iris:sneaking run return run scoreboard players set $entity_height iris 1500000
execute if predicate iris:fall_flying run return run scoreboard players set $entity_height iris 600000

# Special case for crawling, which cannot be detected with a predicate; only works if value of minecraft:scale attribute is 1
execute \
    at @s positioned ~-1.299 ~ ~ if entity @s[dx=0] \
    at @s positioned ~-1.301 ~ ~ unless entity @s[dx=0] \
    at @s positioned ~ ~0.601 ~ unless entity @s[dx=0] \
    run scoreboard players set $entity_height iris 600000
