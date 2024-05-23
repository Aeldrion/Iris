#> iris:get_hitbox/block/xor
#
# Compute bitwise XOR (^) on two scores
#
# @private
# @within iris:get_hitbox/block/offset
# @reads
#   score $a iris
#       The first operand
#   score $b iris
#       The second operand
# @output
#   Return: The result of the XOR operation on both operands
#   Success: 1

scoreboard players operation $a^b iris = $a iris
scoreboard players operation $a^b iris += $b iris

# Compute a&b
scoreboard players set $a&b iris 0
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players set $a&b iris -2147483648
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 1073741824
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 536870912
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 268435456
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 134217728
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 67108864
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 33554432
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 16777216
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 8388608
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 4194304
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 2097152
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 1048576
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 524288
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 262144
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 131072
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 65536
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 32768
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 16384
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 8192
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 4096
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 2048
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 1024
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 512
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 256
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 128
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 64
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 32
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 16
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 8
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 4
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 2
scoreboard players operation $a iris += $a iris
scoreboard players operation $b iris += $b iris
execute if score $a iris matches ..-1 if score $b iris matches ..-1 run scoreboard players add $a&b iris 1

# Compute a^b = a+b-2(a&b)
scoreboard players operation $a^b iris -= $a&b iris
scoreboard players operation $a^b iris -= $a&b iris

# Return the result
return run scoreboard players get $a^b iris
