execute as @a ~ ~ ~ execute as @a[tag=host] run scoreboard players set @s players 0
execute as @a ~ ~ ~ execute as @a[tag=host] run scoreboard players add @s players 1
effect @a[tag=!game_is_running] instant_health 60 255 true
effect @a[tag=!game_is_running] weakness 60 255 true
execute as @a[tag=!game_is_running,tag=host,tag=!end_game,scores={players=..0}] run titleraw @a actionbar {"rawtext":[{"text": "§cThis game requires 1 player to start...\n§rPlayer Count: §c§l"}, {"score":{"name": "@a[tag=host]", "objective": "players"}}]}
execute as @a[tag=!game_is_running,tag=host,tag=!end_game,scores={players=1..}] run titleraw @a actionbar {"rawtext":[{"text": "§aStart the game by executing §d/function start\n§rPlayer Count: §c§l"}, {"score":{"name": "@a[tag=host]", "objective": "players"}}]}
gamemode adventure @a[tag=!game_is_running,tag=!dev,m=!adventure]