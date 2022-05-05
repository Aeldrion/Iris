#> retina:setup/storage
#
# @context any
# @within retina:setup/load
# @writes
#	storage retina:data
#		is_setup: bool Whether storage has already been setup

data merge storage retina:data {is_setup: 1b}
data merge storage retina:input {TargetEntities: false, MaxRecursionDepth: 25}