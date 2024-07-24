gamemode survival @a[tag=game_is_running,m=!survival,tag=!dev]
execute as @a[tag=host] run scoreboard players set @s terminators 0
execute as @e[type=entity:terminator] run execute as @a[tag=host] run scoreboard players add @s terminators 1
execute as @a[tag=host] run scoreboard players set @s speedrunners 0
execute as @a[tag=speedrunner] run execute as @a[tag=host] run scoreboard players add @s speedrunners 1
execute as @a[tag=host,tag=game_is_running] run tag @e[type=entity:terminator] add game_is_running
execute as @a[tag=host,tag=game_is_running,scores={terminators=..0}] run summon entity:terminator ~ ~ ~
effect @a[tag=spectate] invisibility 10 255 true
gamemode a @a[tag=game_is_running,tag=spectate]

execute as @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] run tellraw @a {"rawtext":[{"text":"§b§lGame §r>> §eAll speedrunners died! Hunters won!"}]}
execute as @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] run tag @e[type=entity:terminator] remove hunter
execute as @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] run tag @a[tag=host] add end_game
execute as @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] run tag @a remove game_is_running
execute as @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] run tag @a remove spectate
execute as @a[tag=host,tag=game_is_running,scores={speedrunners=..0}] run effect @a invisibility 0