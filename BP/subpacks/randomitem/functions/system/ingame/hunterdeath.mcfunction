execute @a[tag=host,scores={hunters=1..}] ~~~ tellraw @a {"rawtext":[{"text":"§c§l"}, {"selector": "@a[tag=death]"}, {"text": " died! §r>> §bSpeedrunner still needs to kill the rest of the hunters!"}]}
execute @a[tag=host,scores={hunters=..0}] ~~~ tellraw @a {"rawtext":[{"text":"§c§l"}, {"selector": "@a[tag=death]"}, {"text": " died! §r>> §bSpeedrunner wins!"}]}

execute @a[tag=host,scores={hunters=1..}] ~~~ gamemode 2 @s
execute @a[tag=host,scores={hunters=1..}] ~~~ tag @s remove game_is_running
execute @a[tag=host,scores={hunters=1..}] ~~~ tag @s remove hunter

execute @a[tag=host,scores={hunters=..0}] ~~~ gamemode 2 @a
execute @a[tag=host,scores={hunters=..0}] ~~~ tag @a remove game_is_running
execute @a[tag=host,scores={hunters=..0}] ~~~ tag @a remove hunter
execute @a[tag=host,scores={hunters=..0}] ~~~ tag @a remove speedrunner

title @s title §cYou Died!
