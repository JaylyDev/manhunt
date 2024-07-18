execute as @a[tag=host] run scoreboard players set @s players 0
execute as @a[tag=host] run scoreboard players set @s speedrunners 0
execute as @a[tag=host] run scoreboard players set @s hunters 0
execute as @a run execute as @a[tag=host] run scoreboard players add @s players 1
execute as @a[tag=speedrunner] run execute as @a[tag=host] run scoreboard players add @s speedrunners 1
effect @a[tag=!game_is_running] instant_health 60 255 true
effect @a[tag=!game_is_running] weakness 60 255 true
execute as @a[tag=!game_is_running,tag=host,tag=!end_game,scores={players=..1}] run titleraw @a actionbar {"rawtext":[{"text": "§cThis game requires 2 players to start...\n§rPlayer Count: §c§l"}, {"score":{"name": "@a[tag=host]", "objective": "players"}}]}
execute as @a[tag=!game_is_running,tag=host,tag=!end_game,scores={players=2..}] run titleraw @a actionbar {"rawtext":[{"text": "§aStart the game by executing §d/function start\n§rPlayer Count: §c§l"}, {"score":{"name": "@a[tag=host]", "objective": "players"}}]}
gamemode adventure @a[tag=!game_is_running,tag=!dev,m=!adventure]
execute as @a[tag=!game_is_running,tag=!speedrunner,tag=!host] run tag @s add pre_hunter
execute as @a[tag=!game_is_running,tag=speedrunner] run tag @s remove pre_hunter
execute as @a[scores={speedrunners=1..},tag=!game_is_running,tag=host] run tag @s add pre_hunter
execute as @a[scores={speedrunners=..0},tag=!game_is_running,tag=host] run tag @s remove pre_hunter
execute as @a[tag=pre_hunter] run execute as @a[tag=host] run scoreboard players add @s hunters 1
execute as @a[tag=!game_is_running] run tag @a remove spectate