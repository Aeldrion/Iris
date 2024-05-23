#> iris:get_hitbox/block/offset
#
# Computes seeded block offset for e.g. flowers, assuming the shape comprises a single box
#
# @writes
#	storage iris:data Shape: compound[]
#       A list of cuboids given by two corners in the format {min: [x, y, z], max: [x, y z]}

# Compute seed(x, y, z)
scoreboard players operation $a iris = $[x] iris
scoreboard players operation $a iris *= $3129871 iris
scoreboard players operation $b iris = $[z] iris
scoreboard players operation $b iris *= $116129781 iris
execute store result score $a^b iris run function iris:get_hitbox/block/xor

scoreboard players operation $(a^b)² iris = $a^b iris
scoreboard players operation $(a^b)² iris *= $a^b iris
scoreboard players operation $11*(a^b) iris = $a^b iris
scoreboard players operation $11*(a^b) iris *= $11 iris

scoreboard players operation $seed iris = $(a^b)² iris
scoreboard players operation $seed iris *= $42317861 iris
scoreboard players operation $seed iris += $11*(a^b) iris
scoreboard players operation $seed iris /= $65536 iris

# Compute offsets
scoreboard players operation $x_offset iris = $seed iris
scoreboard players operation $x_offset iris %= $16 iris
scoreboard players operation $x_offset iris *= $33333 iris

scoreboard players operation $z_offset iris = $seed iris
scoreboard players operation $z_offset iris /= $256 iris
scoreboard players operation $z_offset iris %= $16 iris
scoreboard players operation $z_offset iris *= $33333 iris

# Adjust/clamp for pointed dripstone blocks
execute if block ~ ~ ~ minecraft:pointed_dripstone run scoreboard players remove $x_offset iris 125000
execute if block ~ ~ ~ minecraft:pointed_dripstone run scoreboard players remove $z_offset iris 125000
execute if block ~ ~ ~ minecraft:pointed_dripstone if score $x_offset iris matches ..0 run scoreboard players set $x_offset iris 0
execute if block ~ ~ ~ minecraft:pointed_dripstone if score $x_offset iris matches 250000.. run scoreboard players set $x_offset iris 250000
execute if block ~ ~ ~ minecraft:pointed_dripstone if score $z_offset iris matches ..0 run scoreboard players set $z_offset iris 0
execute if block ~ ~ ~ minecraft:pointed_dripstone if score $z_offset iris matches 250000.. run scoreboard players set $z_offset iris 250000

# Apply offsets to the generated shape
execute store result score $min_x iris run data get storage iris:data Shape[0].min[0] 1000000
execute store result storage iris:data Shape[0].min[0] double 0.000001 run scoreboard players operation $min_x iris += $x_offset iris
execute store result score $min_z iris run data get storage iris:data Shape[0].min[2] 1000000
execute store result storage iris:data Shape[0].min[2] double 0.000001 run scoreboard players operation $min_z iris += $z_offset iris
execute store result score $max_x iris run data get storage iris:data Shape[0].max[0] 1000000
execute store result storage iris:data Shape[0].max[0] double 0.000001 run scoreboard players operation $max_x iris += $x_offset iris
execute store result score $max_z iris run data get storage iris:data Shape[0].max[2] 1000000
execute store result storage iris:data Shape[0].max[2] double 0.000001 run scoreboard players operation $max_z iris += $z_offset iris
