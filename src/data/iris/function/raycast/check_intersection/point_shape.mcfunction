# Test for presence within a single bounding box
data modify storage iris:data box set from storage iris:data shape[-1]
tellraw @a {nbt: "shape[-1]", storage: "iris:data"}
data remove storage iris:data shape[-1]
execute store success score $is_in_box iris run function iris:raycast/check_intersection/point_box
execute if score $is_in_box iris matches 1 run return 1

# Loop this function until all boxes have been analyzed
execute if data storage iris:data shape[-1] run return run function iris:raycast/check_intersection/point_shape
return fail
