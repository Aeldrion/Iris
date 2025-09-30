#> iris:get_hitbox/entity
#
# Returns the shape of the executing entity
#
# @within iris:raycast/test_for_entity
# @writes
#	storage iris:data Shape: compound[]
#       A list of cuboids given by two corners in the format {min: [x, y, z], max: [x, y z]}

# Get entity dimensions
function iris:get_hitbox/entity/get_dimensions

# Get the entity's position relative to the block origin
function iris:get_hitbox/entity/get_position

# Calculate the coordinates of the bounding box
function iris:get_hitbox/entity/compute_bounding_box

# Special case for item frames and paintings which are annoying
#execute if score $entity_found iris matches 0 store success score $entity_found iris store success score $entity.is_item_frame iris if entity @s[type=#iris:item_frames]
#execute if score $entity.is_item_frame iris matches 1 run function iris:get_hitbox/entity/item_frame

# Give this entity a tag and an ID, and store the ID in the hitbox
tag @s add iris.possible_target
scoreboard players operation @s iris.id = $max_entity_id iris.id
execute store result storage iris:data Shape[-1].entity_id int 1 run scoreboard players get @s iris.id
scoreboard players add $max_entity_id iris.id 1
