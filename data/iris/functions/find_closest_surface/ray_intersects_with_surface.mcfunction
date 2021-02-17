# Establishes the current surface as the first the ray will hit, executed from iris:find_closest_surface/.../find_intersection

scoreboard players set $ray_hits_surface iris 1
scoreboard players operation $min_distance_to_surface iris = $distance iris

# The three following scores are eventually sent to output storage
scoreboard players operation $targeted_x iris = $x_intersection iris
scoreboard players operation $targeted_y iris = $y_intersection iris
scoreboard players operation $targeted_z iris = $z_intersection iris

data modify storage iris:data ContactSurface set from storage iris:data List[-1]