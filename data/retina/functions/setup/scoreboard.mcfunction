#> retina:setup/scoreboard
#
# @context any
# @within retina:setup/load

scoreboard objectives add retina dummy {"text": "retina", "color": "gold"}
scoreboard objectives add retina.id dummy {"text": "retina entity IDs", "color": "gold"}
scoreboard objectives add retina.show_particle dummy 
scoreboard objectives add retina.show_line dummy 

scoreboard players set $5 retina 5
scoreboard players set $10 retina 10
scoreboard players set $100 retina 100

scoreboard players set $1000 retina 1000
scoreboard players set $1000000 retina 1000000