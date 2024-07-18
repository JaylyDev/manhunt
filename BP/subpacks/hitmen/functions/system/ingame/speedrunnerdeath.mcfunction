tag @s[tag=speedrunner,tag=death] add speedrunner_death
tag @s remove speedrunner
execute as @a[tag=host,scores={speedrunners=1..}] at @s positioned ~ ~ ~ run tellraw @a[tag=speedrunner_death,tag=death] {"rawtext":[{"text":"§b§lGame §r>> §eYou died!"}]}
execute as @a[tag=host,scores={speedrunners=1..}] at @s positioned ~ ~ ~ run tag @a[tag=speedrunner_death,tag=death] add spectate
title @s[tag=speedrunner_death,tag=death] subtitle §cYou lost!
title @s[tag=speedrunner_death,tag=death] title 
gamemode 2 @s
tag @s remove speedrunner_death