execute @a[tag=host] ~ ~ ~ scoreboard players set @s players 0
execute @a[tag=host] ~ ~ ~ scoreboard players set @s speedrunners 0
execute @a[tag=host] ~ ~ ~ scoreboard players set @s hunters 0
execute @a ~ ~ ~ execute @a[tag=host] ~ ~ ~ scoreboard players add @s players 1
execute @a[tag=speedrunner] ~ ~ ~ execute @a[tag=host] ~ ~ ~ scoreboard players add @s speedrunners 1
effect @a[tag=!game_is_running] instant_health 60 255 true
effect @a[tag=!game_is_running] strength 60 255 true
execute @a[tag=!game_is_running,tag=host,tag=!end_game,scores={players=..1}] ~ ~ ~ titleraw @a actionbar {"rawtext":[{"text": "§cThis game requires 2 players to start...\n§rPlayer Count: §c§l"}, {"score":{"name": "@a[tag=host]", "objective": "players"}}]}
execute @a[tag=!game_is_running,tag=host,tag=!end_game,scores={players=2..}] ~ ~ ~ titleraw @a actionbar {"rawtext":[{"text": "§aStart the game by executing §d/function start\n§rPlayer Count: §c§l"}, {"score":{"name": "@a[tag=host]", "objective": "players"}}]}
gamemode adventure @a[tag=!game_is_running,tag=!dev,m=!adventure]
execute @a[tag=!game_is_running,tag=!speedrunner,tag=!host] ~~~ tag @s add pre_hunter
execute @a[tag=!game_is_running,tag=speedrunner] ~~~ tag @s remove pre_hunter
execute @a[scores={speedrunners=1..},tag=!game_is_running,tag=host] ~~~ tag @s add pre_hunter
execute @a[scores={speedrunners=..0},tag=!game_is_running,tag=host] ~~~ tag @s remove pre_hunter
execute @a[tag=pre_hunter] ~ ~ ~ execute @a[tag=host] ~ ~ ~ scoreboard players add @s hunters 1
execute @a[tag=!game_is_running] ~~~ tag @a remove spectate