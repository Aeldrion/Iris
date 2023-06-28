scoreboard players set $block_found iris 1

# Anvils
execute if block ~ ~ ~ #minecraft:anvil run function iris:get_hitbox/block/anvils

# Attached stems
execute if block ~ ~ ~ #iris:attached_stems run function iris:get_hitbox/block/attached_stems

# Beds
execute if block ~ ~ ~ #minecraft:beds run function iris:get_hitbox/block/beds

# Beetroots
execute if block ~ ~ ~ minecraft:beetroots run function iris:get_hitbox/block/beetroots

# Brewing stands
execute if block ~ ~ ~ minecraft:brewing_stand run function iris:get_hitbox/block/brewing_stand

# Buttons
execute if block ~ ~ ~ #minecraft:buttons run function iris:get_hitbox/block/buttons

# Cactus, dragon eggs
execute if block ~ ~ ~ #iris:cactus_shaped run function iris:get_hitbox/block/cactus

# Campfires, soul campfires
execute if block ~ ~ ~ #minecraft:campfires run function iris:get_hitbox/block/campfires
