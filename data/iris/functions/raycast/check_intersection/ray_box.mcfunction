#> iris:raycast/check_intersection/ray_box
#
# Converts an axis-aligned bounding box into three surfaces (the other tree faces are occluded) and tests for ray-plane intersections with any of the surfaces
#
# @reads
#   storage iris:data Box
#       min: float[]
#           The min corner of the box, as three coordinates between 0 and 1
#       max: float[]
#           The max corner of the box, as three coordinates between 0 and 1
# @output
#   Success: 1 if any face of the box is hit, 0 otherwise
#   Result: the distance, in mm, before the first surface that is hit
# @private
# @within iris:raycast/check_intersection/loop

# Check for ray-plane intersection with west or east bound face
data modify storage iris:data Surface set from storage iris:data Box
execute if score $dx iris matches 0.. run data modify storage iris:data Surface.max[0] set from storage iris:data Surface.min[0]
execute if score $dx iris matches ..-1 run data modify storage iris:data Surface.min[0] set from storage iris:data Surface.max[0]
execute store success score $hits_x_face iris store result score $to_x_face iris run function iris:raycast/check_intersection/ray_plane

# Check for ray-plane intersection with up or down bound face
data modify storage iris:data Surface set from storage iris:data Box
execute if score $dy iris matches 0.. run data modify storage iris:data Surface.max[1] set from storage iris:data Surface.min[1]
execute if score $dy iris matches ..-1 run data modify storage iris:data Surface.min[1] set from storage iris:data Surface.max[1]
execute store success score $hits_y_face iris store result score $to_y_face iris run function iris:raycast/check_intersection/ray_plane

# Check for ray-plane intersection with north or south bound face
data modify storage iris:data Surface set from storage iris:data Box
execute if score $dz iris matches 0.. run data modify storage iris:data Surface.max[2] set from storage iris:data Surface.min[2]
execute if score $dz iris matches ..-1 run data modify storage iris:data Surface.min[2] set from storage iris:data Surface.max[2]
execute store success score $hits_z_face iris store result score $to_z_face iris run function iris:raycast/check_intersection/ray_plane

# If no face was hit, fail; otherwise, return the shortest distance to any face that is hit
execute if score $hits_x_face iris matches 0 if score $hits_y_face iris matches 0 if score $hits_z_face iris matches 0 run return fail
execute if score $hits_x_face iris matches 0 run scoreboard players set $to_x_face iris 2147483647
execute if score $hits_y_face iris matches 0 run scoreboard players set $to_y_face iris 2147483647
execute if score $hits_z_face iris matches 0 run scoreboard players set $to_z_face iris 2147483647
scoreboard players operation $to_aabb iris = $to_x_face iris
scoreboard players operation $to_aabb iris < $to_y_face iris
scoreboard players operation $to_aabb iris < $to_z_face iris
return run scoreboard players get $to_aabb iris
