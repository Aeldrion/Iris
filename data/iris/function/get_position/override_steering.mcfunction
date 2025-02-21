#> iris:get_position/override_steering
#
#
# @context A marker and a rotation
# @within iris:get_position/main

execute store result score $dx iris run data get storage iris:data OverrideSteering[0]
execute store result score $dy iris run data get storage iris:data OverrideSteering[1]
execute store result score $dz iris run data get storage iris:data OverrideSteering[2]
