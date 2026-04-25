#> iris:setup/load
#
# Defines scoreboard objectives and sets up storage if it has not already been done
#
# @handles #minecraft:load

# Setup scoreboard and storage
function iris:setup/scoreboard
execute store result score $storage_format iris run data get storage iris:data pack_version
execute if score $storage_format iris < $iris_format iris run function iris:setup/storage
