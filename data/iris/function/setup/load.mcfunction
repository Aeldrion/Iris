#> iris:setup/load
#
# Defines scoreboard objectives and sets up storage if it has not already been done
#
# @handles #minecraft:load

# IDE storage definitions for Spyglass
#define storage iris:data
#define storage iris:args
#define storage iris:settings
#define storage iris:output

# Setup scoreboard and storage
function iris:setup/scoreboard
execute unless data storage iris:data is_setup run function iris:setup/storage
