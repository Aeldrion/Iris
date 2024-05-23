#> iris:get_position/get_rotation
#
# Returns the context rotation as a vector
#
# @within iris:get_position/main
# @context A marker and a rotation

execute positioned 0.0 0.0 0.0 run teleport @s ^ ^ ^1000000
data modify storage iris:data Pos set from entity @s Pos
execute store result score $dx iris run data get storage iris:data Pos[0]
execute store result score $dy iris run data get storage iris:data Pos[1]
execute store result score $dz iris run data get storage iris:data Pos[2]
