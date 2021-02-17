# Runs iris:find_closest_surface/east/loop for all surfaces with air on the east side

data modify storage iris:data List set from storage iris:block Surfaces.East
execute store result score $surfaces iris run data get storage iris:data List
execute if score $surfaces iris matches 1.. run function iris:find_closest_surface/east/loop