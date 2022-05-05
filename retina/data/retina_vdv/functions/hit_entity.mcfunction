scoreboard players set #hit retinacasttemp 1
execute unless entity @s[tag=retina.ray] run scoreboard players set #hit retinacasttemp 0
# execute if entity @s[tag=retina.ray] run kill @e[tag=retina.line,limit=1]