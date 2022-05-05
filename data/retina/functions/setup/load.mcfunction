#> retina:setup/load
#
# Defines scoreboard objectives and sets up storage if it has not already been done
#
# @handles #minecraft:load
# @context any

# Data-pack Helper Plus storage definitions
#define storage retina:data
#define storage retina:input
#define storage retina:output

execute unless data storage retina:data is_setup run function retina:setup/scoreboard
execute unless data storage retina:data is_setup run function retina:setup/storage