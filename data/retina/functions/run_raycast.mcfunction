scoreboard players operation $total_count retina = $horizontal_count retina
scoreboard players operation $total_count retina *= $vertical_count retina
scoreboard players operation $total_count retina += $center_count retina


execute if score $total_count retina matches 1 if score $spread_enabled_local retina matches 0 at @s anchored eyes positioned ^ ^ ^ run function retina:raycast/singlecast
execute if score $total_count retina matches 1 unless score $spread_enabled_local retina matches 0 at @s anchored eyes positioned ^ ^ ^ run function retina:raycast/randomcast
execute unless score $total_count retina matches 1 at @s anchored eyes positioned ^ ^ ^-0.6 run function retina:raycast/multicast/start