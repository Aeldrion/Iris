#> iris:get_hitbox/block
#
# Returns the shape of the current block
#
# @within iris:raycast/test_for_block
# @output
#	storage iris:data shape: compound[]
#       A list of cuboids given by two corners in the format {min: [x, y, z], max: [x, y z]}
from iris:main import BRANCHES
for i in range(BRANCHES):
    execute if block ~ ~ ~ f"#iris:tree/branch_{i}" run function f"iris:get_hitbox/block/tree/branch_{i}"
execute if block ~ ~ ~ #iris:has_block_offset run function iris:get_hitbox/block/offset
