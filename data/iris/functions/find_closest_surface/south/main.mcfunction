# Runs iris:find_closest_surface/south/loop for all surfaces with air on the south side

data modify storage iris:data List set from storage iris:block Surfaces.South
execute store result score $surfaces iris run data get storage iris:data List
execute if score $surfaces iris matches 1.. run function iris:find_closest_surface/south/loop