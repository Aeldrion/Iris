#> iris:get_hitbox/entity
#
# Returns the shape of the executing entity
#
# @within iris:raycast/test_for_entity
# @writes
#	storage iris:data shape: compound[]
#       A list of cuboids given by two corners in the format {min: [x, y, z], max: [x, y z]}

# Get entity dimensions
from iris:main import BRANCHES
for i in range(BRANCHES):
    execute if entity @s[type=f"#iris:tree/branch_{i}"] run function f"iris:get_hitbox/entity/tree/branch_{i}"

# Scale
function iris:get_hitbox/entity/scale
execute if predicate iris:baby run scoreboard players operation $entity_width iris /= $2 iris
execute if predicate iris:baby run scoreboard players operation $entity_height iris /= $2 iris

# Calculate the coordinates of the bounding box
function iris:get_hitbox/entity/get_position
function iris:get_hitbox/entity/compute_bounding_box

# Give this entity a tag and an ID, and store the ID in the hitbox
tag @s add iris.possible_target
scoreboard players operation @s iris.id = $max_entity_id iris.id
execute store result storage iris:data shape[-1].entity_id int 1 run scoreboard players get @s iris.id
scoreboard players add $max_entity_id iris.id 1
