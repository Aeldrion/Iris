#> iris:setup/storage
#
# Sets up storage for Iris
#
# @within iris:setup/load

data merge storage iris:data {\
    pack_version: 2\
}

# Set default settings
data merge storage iris:settings {\
    target_entities: false,\
    max_distance: 5.0,\
    blacklist: "#iris:shape_groups/air"\
}
