execute store result score $min_x iris run data get storage iris:data box.min[0] 1000000
execute store result score $min_y iris run data get storage iris:data box.min[1] 1000000
execute store result score $min_z iris run data get storage iris:data box.min[2] 1000000
execute store result score $max_x iris run data get storage iris:data box.max[0] 1000000
execute store result score $max_y iris run data get storage iris:data box.max[1] 1000000
execute store result score $max_z iris run data get storage iris:data box.max[2] 1000000

return run execute \
    if score ${x} iris >= $min_x iris if score ${x} iris <= $max_x iris \
    if score ${y} iris >= $min_y iris if score ${y} iris <= $max_y iris \
    if score ${z} iris >= $min_z iris if score ${z} iris <= $max_z iris