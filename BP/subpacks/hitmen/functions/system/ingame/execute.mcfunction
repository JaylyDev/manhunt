gamemode survival @a[tag=game_is_running,m=!survival,tag=!dev]
scoreboard players add @a[scores={compass_cd=1..}] compass_cd -1
# TIMER
scoreboard players add @a[tag=host,tag=game_is_running,scores={time_t=0..20}] time_t -1
scoreboard players add @a[tag=host,tag=game_is_running,scores={time_t=..-1}] time_s -1
scoreboard players set @a[tag=host,tag=game_is_running,scores={time_t=..-1}] time_t 19
scoreboard players add @a[tag=host,tag=game_is_running,scores={time_s=..-1}] time_m -1
scoreboard players set @a[tag=host,tag=game_is_running,scores={time_s=..-1}] time_s 59
execute as @a[tag=host,tag=game_is_running,scores={time_m=-1}] run function system/ingame/timerends
execute as @a[tag=host,tag=game_is_running,scores={time_s=10..60}] run titleraw @a[tag=game_is_running] actionbar {"rawtext":[{"text":"§cTime: §r§l"}, {"score":{"name":"@a[tag=host,tag=game_is_running]","objective":"time_m"}}, {"text":":"}, {"score":{"name":"@a[tag=host,tag=game_is_running]","objective":"time_s"}}]}
execute as @a[tag=host,tag=game_is_running,scores={time_s=0..9}] run titleraw @a[tag=game_is_running] actionbar {"rawtext":[{"text":"§cTime: §r§l"}, {"score":{"name":"@a[tag=host,tag=game_is_running]","objective":"time_m"}}, {"text":":0"}, {"score":{"name":"@a[tag=host,tag=game_is_running]","objective":"time_s"}}]}

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