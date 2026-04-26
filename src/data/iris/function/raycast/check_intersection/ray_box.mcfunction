#> iris:raycast/check_intersection/ray_box
#
# Converts an axis-aligned bounding box into three faces (the other tree faces are occluded) and tests for ray-plane intersections with any of them
#
# @within iris:raycast/check_intersection/loop
# @reads
#   storage iris:data box
#       min: float[]
#           The min corner of the box, as three coordinates between 0 and 1
#       max: float[]
#           The max corner of the box, as three coordinates between 0 and 1
# @output
#   Success: 1 if any face of the box is hit, 0 otherwise
#   Result: the distance, in mm, before the first face that is hit

# Decompose the box as three faces
data modify storage iris:data faces set value [{}, {}, {}]
data modify storage iris:data faces[0] merge from storage iris:data box
execute if score $dx iris matches 0.. run data modify storage iris:data faces[0].max[0] set from storage iris:data box.min[0]
execute if score $dx iris matches 0.. run data modify storage iris:data faces[0].normal set value [-1, 0, 0]
execute if score $dx iris matches ..-1 run data modify storage iris:data faces[0].min[0] set from storage iris:data box.max[0]
execute if score $dx iris matches ..-1 run data modify storage iris:data faces[0].normal set value [1, 0, 0]
data modify storage iris:data faces[1] merge from storage iris:data box
execute if score $dy iris matches 0.. run data modify storage iris:data faces[1].max[1] set from storage iris:data box.min[1]
execute if score $dy iris matches 0.. run data modify storage iris:data faces[1].normal set value [0, -1, 0]
execute if score $dy iris matches ..-1 run data modify storage iris:data faces[1].min[1] set from storage iris:data box.max[1]
execute if score $dy iris matches ..-1 run data modify storage iris:data faces[1].normal set value [0, 1, 0]
data modify storage iris:data faces[2] merge from storage iris:data box
execute if score $dz iris matches 0.. run data modify storage iris:data faces[2].max[2] set from storage iris:data box.min[2]
execute if score $dz iris matches 0.. run data modify storage iris:data faces[2].normal set value [0, 0, -1]
execute if score $dz iris matches ..-1 run data modify storage iris:data faces[2].min[2] set from storage iris:data box.max[2]
execute if score $dz iris matches ..-1 run data modify storage iris:data faces[2].normal set value [0, 0, 1]

# Check for ray-plane intersections
data modify storage iris:data face set from storage iris:data faces[0]
scoreboard players set $face_direction iris 0
execute store success score $hits_x_face iris store result score $to_x_face iris run function iris:raycast/check_intersection/ray_plane {axis: "x"}
execute if score $hits_x_face iris matches 0 run scoreboard players set $to_x_face iris 2147483647
execute if score $hits_x_face iris matches 1 if score $to_x_face iris < $min_distance iris run data modify storage iris:data targeted_face set from storage iris:data face
scoreboard players operation $to_aabb iris = $to_x_face iris

data modify storage iris:data face set from storage iris:data faces[1]
scoreboard players set $face_direction iris 1
execute store success score $hits_y_face iris store result score $to_y_face iris run function iris:raycast/check_intersection/ray_plane {axis: "y"}
execute if score $hits_y_face iris matches 0 run scoreboard players set $to_y_face iris 2147483647
execute if score $hits_y_face iris matches 1 if score $to_y_face iris < $min_distance iris if score $to_y_face iris < $to_x_face iris run data modify storage iris:data targeted_face set from storage iris:data face
scoreboard players operation $to_aabb iris < $to_y_face iris

data modify storage iris:data face set from storage iris:data faces[2]
scoreboard players set $face_direction iris 2
execute store success score $hits_z_face iris store result score $to_z_face iris run function iris:raycast/check_intersection/ray_plane {axis: "z"}
execute if score $hits_z_face iris matches 0 run scoreboard players set $to_z_face iris 2147483647
execute if score $hits_z_face iris matches 1 if score $to_z_face iris < $min_distance iris if score $to_z_face iris < $to_x_face iris if score $to_z_face iris < $to_y_face iris run data modify storage iris:data targeted_face set from storage iris:data face
scoreboard players operation $to_aabb iris < $to_z_face iris

# If no face was hit, fail
execute if score $hits_x_face iris matches 0 if score $hits_y_face iris matches 0 if score $hits_z_face iris matches 0 run return fail

# If all faces are further away than the current best, fail; otherwise, update distance
execute if score $to_aabb iris >= $min_distance iris run return fail
return run scoreboard players operation $min_distance iris = $to_aabb iris
