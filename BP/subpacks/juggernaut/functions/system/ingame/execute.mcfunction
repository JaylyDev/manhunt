gamemode survival @a[tag=game_is_running,m=!survival,tag=!dev]

execute as @a[tag=host,tag=game_is_running,scores={graceperiod=1,gptimer=1200}] run tellraw @a {"rawtext":[{"text": "Enabling §3PvP§r in §31 minute"}]}
execute as @a[tag=host,tag=game_is_running,scores={graceperiod=1,gptimer=0}] run tellraw @a {"rawtext":[{"text": "§3PvP§r is now enabled"}]}
execute as @a[tag=host,tag=game_is_running,scores={graceperiod=1,gptimer=0}] run gamerule pvp true
scoreboard players add @a[tag=host,tag=game_is_running,scores={graceperiod=1,gptimer=0..1200}] gptimer -1

execute as @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] run tag @a[tag=host] add end_game
execute as @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] run tellraw @a {"rawtext":[{"text":"§b§lGame §r>> §eSpeedrunner died! Hunters won!"}]}
execute as @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] run title @a[tag=hunter] subtitle §eCongratulations!
execute as @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] run title @a[tag=hunter] title §eYou won!
execute as @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] run title @a[tag=speedrunner] subtitle §cYou lost!
execute as @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] run title @a[tag=speedrunner] title 
execute as @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] run gamemode 2 @a
execute as @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] run tag @a remove game_is_running
execute as @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] run tag @a remove hunter
execute as @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] run tag @a remove speedrunner