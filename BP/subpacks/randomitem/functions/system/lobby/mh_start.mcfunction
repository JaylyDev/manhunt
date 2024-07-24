## Start the manhunt
execute as @a[tag=host,scores={speedrunners=..0}] run tag @s add speedrunner
tag @a[tag=!speedrunner] add hunter
tag @a add game_is_running

#introduction to the game
tellraw @a {"rawtext":[{"text":"§6§lMinecraft Manhunt (Random Items)"}]}
tellraw @a {"rawtext":[{"text":"―――――――――――――――――"}]}
tellraw @a {"rawtext":[{"text":"§bSpeedrunner§r:§b§l "}, {"selector": "@a[tag=speedrunner,tag=game_is_running]"}]}
tellraw @a {"rawtext":[{"text":"§b§l"}, {"selector": "@a[tag=speedrunner,tag=game_is_running]"}, {"text":"§r's goal is to take down all the hunters"}]}
tellraw @a {"rawtext":[{"text":"§bIf "}, {"selector": "@a[tag=hunter,tag=game_is_running]"}, {"text":" killed all the hunters before their death, the speedrunner wins. If the speedrunner died, they lose."}]}
tellraw @a {"rawtext":[{"text":"―――――――――――――――――"}]}
execute as @a[tag=host,scores={players=..2}] run tellraw @a {"rawtext":[{"text":"§bHunter§r:§b§l "}, {"selector": "@a[tag=hunter,tag=game_is_running]"}]}
execute as @a[tag=host,scores={players=3..}] run tellraw @a {"rawtext":[{"text":"§bHunters§r:§b§l "}, {"selector": "@a[tag=hunter,tag=game_is_running]"}]}
tellraw @a {"rawtext":[{"text":"§c§l"}, {"selector": "@a[tag=hunter,tag=game_is_running]"}, {"text":"§r's goal is to kill the speedrunner before they kill the hunters."}]}
tellraw @a {"rawtext":[{"text":"§cThey only has 1 life and they do not have compass."}]}
tellraw @a {"rawtext":[{"text":"―――――――――――――――――"}]}
tellraw @a {"rawtext":[{"text":"§c§lRules§r: Every item dropped on the ground will disappear except the moment you get a random type of items. There is a 1000x1000 border. Every two minutes we each get a completely random item. You can pick up each others items."}]}

#miscs
execute as @a[tag=host] run spreadplayers 0 0 0 10 @a
execute as @a[tag=host] run setworldspawn 0 64 0
execute as @a[tag=host] run spawnpoint @a 0 64 0
scoreboard players set @a[tag=host] item_cd 2200
scoreboard players set @s[tag=host,scores={graceperiod=1}] gptimer 1200
execute as @a[tag=host,scores={graceperiod=0}] run gamerule pvp true
execute as @a[tag=host,scores={graceperiod=1}] run gamerule pvp false
gamerule falldamage true
gamerule drowningdamage true
gamerule firedamage true
effect @a instant_health 0 0 true
effect @a weakness 0 0 true
execute as @a at @s if block ~~-1~ air[] run effect @s slow_falling 30 0 true