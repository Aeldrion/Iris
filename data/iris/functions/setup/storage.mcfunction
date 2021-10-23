#> iris:setup/storage
#
# @context any
# @within iris:setup/load
# @writes
#	storage iris:data
#		is_setup: bool Whether storage has already been setup
#	storage iris:input
#		TargetEntities: bool Whether or not to look for entities on the path of the ray

data merge storage iris:data {is_setup: 1b}
data merge storage iris:input {TargetEntities: false}