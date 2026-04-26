#> iris:get_position/main
#
# @within iris:get_target

execute unless data storage iris:settings override.position summon minecraft:marker run function iris:get_position/get_coordinates
execute if data storage iris:settings override.position store result score $dx iris run data get storage iris:settings override.position[0] 1000000
execute if data storage iris:settings override.position store result score $dy iris run data get storage iris:settings override.position[0] 1000000
execute if data storage iris:settings override.position store result score $dz iris run data get storage iris:settings override.position[0] 1000000
execute unless data storage iris:settings override.steering summon minecraft:marker run function iris:get_position/get_rotation
