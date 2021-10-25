#> iris:setup/load
#
# Defines scoreboard objectives and sets up storage if it has not already been done
#
# @handles #minecraft:load
# @context any

# Data-pack Helper Plus storage definitions
#define storage iris:data
#define storage iris:input
#define storage iris:output

execute unless data storage iris:data is_setup run function iris:setup/scoreboard
execute unless data storage iris:data is_setup run function iris:setup/storage