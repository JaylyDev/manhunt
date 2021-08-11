gamemode survival @a[tag=game_is_running,m=!survival,tag=!dev]
scoreboard players add @a[scores={compass_cd=1..}] compass_cd -1
execute @a[tag=host] ~ ~ ~ scoreboard players set @s terminators 0
execute @e[type=entity:terminator] ~ ~ ~ execute @a[tag=host] ~ ~ ~ scoreboard players add @s terminators 1
execute @a[tag=host] ~ ~ ~ scoreboard players set @s speedrunners 0
execute @a[tag=speedrunner] ~ ~ ~ execute @a[tag=host] ~ ~ ~ scoreboard players add @s speedrunners 1
execute @a[tag=host,tag=game_is_running] ~ ~ ~ tag @e[type=entity:terminator] add game_is_running
execute @a[tag=host,tag=game_is_running,scores={terminators=..0}] ~ ~ ~ summon entity:terminator ~ ~ ~
effect @a[tag=spectate] invisibility 10 255 true
gamemode a @a[tag=game_is_running,tag=spectate]

execute @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] ~ ~ ~ tellraw @a {"rawtext":[{"text":"§b§lGame §r>> §eAll speedrunners died! Hunters won!"}]}
execute @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] ~ ~ ~ tag @e[type=entity:terminator] remove hunter
execute @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] ~ ~ ~ tag @a[tag=host] add end_game
execute @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] ~ ~ ~ tag @a remove game_is_running
execute @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] ~ ~ ~ tag @a remove spectate
execute @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] ~ ~ ~ effect @a invisibility 0