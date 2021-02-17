# Establishes the current surface as the first the ray will hit, executed from iris:find_closest_surface/.../find_intersection

scoreboard players set $ray_hits_surface iris 1
scoreboard players set $min_distance_to_surface iris 0
data modify storage iris:data ContactSurface set from storage iris:data List[-1]

# The three following scores are eventually sent to output storage
scoreboard players operation $targeted_x iris = ${x} iris
scoreboard players operation $targeted_y iris = ${y} iris
scoreboard players operation $targeted_z iris = ${z} iris