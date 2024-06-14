#> iris:setup/storage
#
# Sets up storage for Iris
#
# @within iris:setup/load

data merge storage iris:data {is_setup: 1b}

# Set default settings
data merge storage iris:settings {\
    TargetEntities: false,\
    MaxRecursionDepth: 16,\
    Blacklist: "#iris:shape_groups/air"\
}
