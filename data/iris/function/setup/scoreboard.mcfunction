#> iris:setup/scoreboard
#
# Sets up the scoreboard (objectives and scores) for Iris
#
# @within iris:setup/load

scoreboard objectives add iris dummy {"text": "Iris", "color": "gold"}
scoreboard objectives add iris.id dummy {"text": "Iris entity IDs", "color": "gold"}

scoreboard players set $-1 iris -1
scoreboard players set $2 iris 2
scoreboard players set $11 iris 11
scoreboard players set $16 iris 16
scoreboard players set $256 iris 256
scoreboard players set $1000 iris 1000
scoreboard players set $33333 iris 33333
scoreboard players set $65536 iris 65536
scoreboard players set $1000000 iris 1000000
scoreboard players set $3129871 iris 3129871
scoreboard players set $42317861 iris 42317861
scoreboard players set $116129781 iris 116129781
