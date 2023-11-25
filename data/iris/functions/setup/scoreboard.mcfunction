#> iris:setup/scoreboard
#
# Sets up the scoreboard (objectives and scores) for Iris
#
# @within iris:setup/load

scoreboard objectives add iris dummy {"text": "Iris", "color": "gold"}
scoreboard objectives add iris.id dummy {"text": "Iris entity IDs", "color": "gold"}

scoreboard players set $-1 iris -1
scoreboard players set $1000 iris 1000
scoreboard players set $1000000 iris 1000000
