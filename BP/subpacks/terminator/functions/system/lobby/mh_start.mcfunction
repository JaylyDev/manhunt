## Start the manhunt
execute as @a[tag=host] run summon entity:terminator
tag @a add speedrunner
tag @e[type=entity:terminator] add hunter
tag @a add game_is_running

#introduction to the game
tellraw @a {"rawtext":[{"text":"§6§lMinecraft Manhunt"}]}
tellraw @a {"rawtext":[{"text":"―――――――――――――――――"}]}
tellraw @a {"rawtext":[{"text":"§bSpeedrunner§r:§b§l "}, {"selector": "@a[tag=speedrunner,tag=game_is_running]"}]}
tellraw @a {"rawtext":[{"text":"§b§l"}, {"selector": "@a[tag=speedrunner,tag=game_is_running]"}, {"text":"§r's goal is to beat Minecraft"}]}
tellraw @a {"rawtext":[{"text":"§bIf "}, {"selector": "@e[type=entity:terminator,tag=game_is_running]"}, {"text":" beat Minecraft before killed by hunter(s), the speedrunner wins. If the speedrunner died, they lose."}]}
tellraw @a {"rawtext":[{"text":"―――――――――――――――――"}]}
tellraw @a {"rawtext":[{"text":"§c§lTerminator§r's goal is to kill the speedrunner before they beat Minecraft."}]}
tellraw @a {"rawtext":[{"text":"§cTerminators have a working compass to track the speedrunner in the same dimension."}]}
tellraw @a {"rawtext":[{"text":"§cThey also have unlimited amount of regeneration."}]}

## miscs
execute as @a[tag=host] run spreadplayers ~ ~ 0 10 @a
execute as @a[tag=host] run setworldspawn ~ ~ ~
execute as @a[tag=host] run spawnpoint @a ~ ~ ~
gamerule pvp true
gamerule falldamage true
gamerule drowningdamage true
gamerule firedamage true
effect @a instant_health 0 0 true
effect @a weakness 0 0 true