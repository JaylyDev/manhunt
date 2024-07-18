## Start the manhunt
execute as @a[tag=host,scores={speedrunners=..0}] run tag @s add speedrunner
tag @a[tag=!speedrunner] add hunter
tag @a add game_is_running

#introduction to the game
tellraw @a {"rawtext":[{"text":"§6§lMinecraft Hitmen"}]}
tellraw @a {"rawtext":[{"text":"―――――――――――――――――"}]}
tellraw @a {"rawtext":[{"text":"§bSpeedrunner§r:§b§l "}, {"selector": "@a[tag=speedrunner,tag=game_is_running]"}]}
tellraw @a {"rawtext":[{"text":"§b§l"}, {"selector": "@a[tag=speedrunner,tag=game_is_running]"}, {"text":"§r's goal is to beat Minecraft"}]}
tellraw @a {"rawtext":[{"text":"§bIf "}, {"selector": "@a[tag=hunter,tag=game_is_running]"}, {"text":" beat Minecraft before killed by hunter(s), the speedrunner wins. If the speedrunner died, they lose."}]}
tellraw @a {"rawtext":[{"text":"―――――――――――――――――"}]}
execute as @a[tag=host,scores={players=..2}] run tellraw @a {"rawtext":[{"text":"§bHunter§r:§b§l "}, {"selector": "@a[tag=hunter,tag=game_is_running]"}]}
execute as @a[tag=host,scores={players=3..}] run tellraw @a {"rawtext":[{"text":"§bHunters§r:§b§l "}, {"selector": "@a[tag=hunter,tag=game_is_running]"}]}
tellraw @a {"rawtext":[{"text":"§c§l"}, {"selector": "@a[tag=hunter,tag=game_is_running]"}, {"text":"§r's goal is to kill the speedrunner before they beat Minecraft."}]}
tellraw @a {"rawtext":[{"text":"§cHunters have a working compass to track the speedrunner in the overworld."}]}
tellraw @a {"rawtext":[{"text":"§cThey also have unlimited life and they won't lose their compass."}]}

#miscs
execute as @a[tag=host] run spreadplayers ~ ~ 0 10 @a
execute as @a[tag=host] run setworldspawn ~ ~ ~
execute as @a[tag=host] run spawnpoint @a ~ ~ ~
scoreboard players set @a compass_cd 0
scoreboard players set @a[tag=host,scores={time_t=!0..20}] time_t 0
scoreboard players set @a[tag=host,scores={time_t=!0..60}] time_s 0
scoreboard players set @a[tag=host,scores={time_t=!0..60}] time_m 60
scoreboard players set @s[tag=host,scores={graceperiod=1}] gptimer 1200
replaceitem entity @a[tag=hunter,tag=game_is_running] slot.hotbar 0 compass 1 0 {"minecraft:item_lock":{"mode": "lock_in_slot"}, "minecraft:keep_on_death":{}}
execute as @a[tag=host,scores={graceperiod=0}] run gamerule pvp true
execute as @a[tag=host,scores={graceperiod=1}] run gamerule pvp false
gamerule falldamage true
gamerule drowningdamage true
gamerule firedamage true
effect @a instant_health 0 0 true
effect @a weakness 0 0 true