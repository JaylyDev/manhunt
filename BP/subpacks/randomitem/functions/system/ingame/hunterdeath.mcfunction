execute as @a[tag=host,scores={hunters=1..}] run tellraw @a {"rawtext":[{"text":"§c§l"}, {"selector": "@a[tag=death]"}, {"text": " died! §r>> §bSpeedrunner still needs to kill the rest of the hunters!"}]}
execute as @a[tag=host,scores={hunters=..0}] run tellraw @a {"rawtext":[{"text":"§c§l"}, {"selector": "@a[tag=death]"}, {"text": " died! §r>> §bSpeedrunner wins!"}]}

execute as @a[tag=host,scores={hunters=1..}] run gamemode 2 @s
execute as @a[tag=host,scores={hunters=1..}] run tag @s remove game_is_running
execute as @a[tag=host,scores={hunters=1..}] run tag @s remove hunter

execute as @a[tag=host,scores={hunters=..0}] run gamemode 2 @a
execute as @a[tag=host,scores={hunters=..0}] run tag @a remove game_is_running
execute as @a[tag=host,scores={hunters=..0}] run tag @a remove hunter
execute as @a[tag=host,scores={hunters=..0}] run tag @a remove speedrunner

title @s title §cYou Died!
