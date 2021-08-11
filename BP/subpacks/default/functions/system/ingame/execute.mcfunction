gamemode survival @a[tag=game_is_running,m=!survival,tag=!dev]
scoreboard players add @a[scores={compass_cd=1..}] compass_cd -1
effect @a[tag=spectate] invisibility 10 255 true
gamemode a @a[tag=game_is_running,tag=spectate]

execute @a[tag=host,tag=game_is_running,scores={graceperiod=1,gptimer=1200}] ~~~ tellraw @a {"rawtext":[{"text": "Enabling §3PvP§r in §31 minute"}]}
execute @a[tag=host,tag=game_is_running,scores={graceperiod=1,gptimer=0}] ~~~ tellraw @a {"rawtext":[{"text": "§3PvP§r is now enabled"}]}
execute @a[tag=host,tag=game_is_running,scores={graceperiod=1,gptimer=0}] ~~~ gamerule pvp true
scoreboard players add @a[tag=host,tag=game_is_running,scores={graceperiod=1,gptimer=0..1200}] gptimer -1

execute @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] ~~~ tag @a[tag=host] add end_game
execute @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] ~~~ tellraw @a {"rawtext":[{"text":"§b§lGame §r>> §eSpeedrunner died! Hunters won!"}]}
execute @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] ~~~ title @a[tag=hunter] subtitle §eCongratulations!
execute @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] ~~~ title @a[tag=hunter] title §eYou won!
execute @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] ~~~ title @a[tag=speedrunner] subtitle §cYou lost!
execute @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] ~~~ title @a[tag=speedrunner] title 
execute @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] ~~~ gamemode 2 @a
execute @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] ~~~ tag @a remove game_is_running
execute @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] ~~~ tag @a remove hunter
execute @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] ~~~ tag @a remove speedrunner