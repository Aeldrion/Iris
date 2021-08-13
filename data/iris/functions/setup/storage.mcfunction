#> iris:setup/storage
#
# @context any
# @within iris:setup/load
# @writes
#	storage iris:data
#		is_setup: bool Whether storage has already been setup
#	storage iris:input
#		skip_entities: bool Unused
#		distance: int Unused

data merge storage iris:data {is_setup: 1b}
data merge storage iris:input {skip_entities: 0b, distance: 16}