#> iris:setup/storage
#
# @context any
# @within iris:setup/load
# @writes
#	storage iris:data
#		is_setup: bool Whether storage has already been setup

data merge storage iris:data {is_setup: 1b}
data merge storage iris:input {TargetEntities: false, MaxRecursionDepth: 16}