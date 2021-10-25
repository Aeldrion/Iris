#> iris:setup/scoreboard
#
# @context any
# @within iris:setup/load

scoreboard objectives add iris dummy {"text": "Iris", "color": "gold"}
scoreboard objectives add iris.id dummy {"text": "Iris entity IDs", "color": "gold"}

scoreboard players set $1000 iris 1000
scoreboard players set $1000000 iris 1000000