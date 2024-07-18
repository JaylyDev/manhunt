gamemode survival @a[tag=game_is_running,m=!survival,tag=!dev]
scoreboard players add @a[scores={compass_cd=1..}] compass_cd -1
## The 1000x1000 Border
execute as @a[tag=game_is_running] 500 ~ ~ fill ~ 0 ~-7 ~ 255 ~7 stained_glass 11
execute as @a[tag=game_is_running] -500 ~ ~ fill ~ 0 ~-7 ~ 255 ~7 stained_glass 11
execute as @a[tag=game_is_running] ~ ~ 500 fill ~-7 0 ~ ~7 255 ~ stained_glass 11
execute as @a[tag=game_is_running] ~ ~ -500 fill ~-7 0 ~ ~7 255 ~ stained_glass 11

execute as @a ~ ~ ~ execute as @a[x=500,dx=2147483147,tag=game_is_running] run tellraw @s {"rawtext":[{"text": "§cError§r: You are not permitted to enter this area."}]}
execute as @a ~ ~ ~  execute as @a[x=-500,dx=-2147483147,tag=game_is_running] run tellraw @s {"rawtext":[{"text": "§cError§r: You are not permitted to enter this area."}]}
execute as @a ~ ~ ~  execute as @a[z=500,dz=2147483147,tag=game_is_running] run tellraw @s {"rawtext":[{"text": "§cError§r: You are not permitted to enter this area."}]}
execute as @a ~ ~ ~ execute as @a[z=-500,dz=-2147483147,tag=game_is_running] run tellraw @s {"rawtext":[{"text": "§cError§r: You are not permitted to enter this area."}]}
execute as @a ~~~ tp @s[x=500,dx=2147483147,tag=game_is_running] 495 ~ ~
execute as @a ~~~ tp @s[x=-500,dx=-2147483147,tag=game_is_running] -495 ~ ~
execute as @a ~~~ tp @s[z=500,dz=2147483147,tag=game_is_running] ~ ~ 495
execute as @a ~~~ tp @s[z=-500,dz=-2147483147,tag=game_is_running] ~ ~ -495

## The item randomizers
scoreboard players remove @a[tag=host,tag=game_is_running,scores={item_cd=1..2400}] item_cd 1
execute as @a[tag=game_is_running,scores={item_cd=..0}] run function system/ingame/randomitem
execute as @a[tag=game_is_running,scores={item_cd=..0}] run scoreboard players set @s item_cd 2400
execute as @a[tag=game_is_running,scores={item_cd=2401..}] run tellraw @a {"rawtext":[{"text": "§cError§r: Item cooldown time value has reached the limit. Time: "},{ "score": {"name": "@a[tag=host]", "objective": "item_cd" }}, {"text": "\n§cCode§r: value_reached_maxinum_value"}]}
execute as @a[tag=game_is_running,scores={item_cd=2401..}] run scoreboard players set @s item_cd 2400
execute as @a[tag=game_is_running,scores={item_cd=2300}] run tellraw @a {"rawtext":[{"text":"§c§l>>§rItem will despawn in 5 seconds!"}]}
execute as @a[tag=game_is_running,scores={item_cd=2200}] run tellraw @a {"rawtext":[{"text":"§c§l>>§rItem now despawns until next random item event (2 minutes)!"}]}
execute as @a[tag=game_is_running,scores={item_cd=..2200}] run kill @e[type=item]

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