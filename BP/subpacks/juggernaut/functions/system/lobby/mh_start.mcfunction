## Start the manhunt
execute as @a[tag=host,scores={speedrunners=..0}] run tag @s add speedrunner
tag @a[tag=!speedrunner] add hunter
tag @a add game_is_running

#introduction to the game
tellraw @a {"rawtext":[{"text":"§6§lMinecraft Juggernaut"}]}
tellraw @a {"rawtext":[{"text":"―――――――――――――――――"}]}
tellraw @a {"rawtext":[{"text":"§bSpeedrunner§r:§b§l "}, {"selector": "@a[tag=speedrunner,tag=game_is_running]"}]}
tellraw @a {"rawtext":[{"text":"§b§l"}, {"selector": "@a[tag=speedrunner,tag=game_is_running]"}, {"text":"§r's goal is to beat Minecraft"}]}
tellraw @a {"rawtext":[{"text":"§bIf "}, {"selector": "@a[tag=hunter,tag=game_is_running]"}, {"text":" beat Minecraft before killed by juggernaut(s), the speedrunner wins. If the speedrunner died, they lose."}]}
tellraw @a {"rawtext":[{"text":"―――――――――――――――――"}]}
execute as @a[tag=host,scores={players=..2}] run tellraw @a {"rawtext":[{"text":"§bJuggernaut§r:§b§l "}, {"selector": "@a[tag=hunter,tag=game_is_running]"}]}
execute as @a[tag=host,scores={players=3..}] run tellraw @a {"rawtext":[{"text":"§bJuggernauts§r:§b§l "}, {"selector": "@a[tag=hunter,tag=game_is_running]"}]}
tellraw @a {"rawtext":[{"text":"§c§l"}, {"selector": "@a[tag=hunter,tag=game_is_running]"}, {"text":"§r's goal is to kill the speedrunner before they beat Minecraft."}]}
tellraw @a {"rawtext":[{"text":"§cJuggernauts have a working compass to track the speedrunner in the same dimension."}]}
tellraw @a {"rawtext":[{"text":"§cThey also have unlimited life and they won't lose their compass and juggernaut's kit."}]}

#miscs
execute as @a[tag=host] run spreadplayers ~ ~ 0 10 @a
execute as @a[tag=host] run setworldspawn ~ ~ ~
execute as @a[tag=host] run spawnpoint @a ~ ~ ~
replaceitem entity @a[tag=hunter,tag=game_is_running] slot.weapon.offhand 0 jayly:compass_0 1 0 {"minecraft:item_lock":{"mode":"lock_in_inventory"}, "minecraft:keep_on_death":{}}
replaceitem entity @a[tag=hunter,tag=game_is_running] slot.armor.head 0 diamond_helmet 1 0 {"minecraft:keep_on_death":{}}
replaceitem entity @a[tag=hunter,tag=game_is_running] slot.armor.chest 0 diamond_chestplate 1 0 {"minecraft:keep_on_death":{}}
replaceitem entity @a[tag=hunter,tag=game_is_running] slot.armor.legs 0 diamond_leggings 1 0 {"minecraft:keep_on_death":{}}
replaceitem entity @a[tag=hunter,tag=game_is_running] slot.armor.feet 0 diamond_boots 1 0 {"minecraft:keep_on_death":{}}
replaceitem entity @a[tag=hunter,tag=game_is_running] slot.hotbar 0 diamond_sword 1 0 {"minecraft:keep_on_death":{}}
scoreboard players set @s[tag=host,scores={graceperiod=1}] gptimer 1200
execute as @a[tag=host,scores={graceperiod=0}] run gamerule pvp true
execute as @a[tag=host,scores={graceperiod=1}] run gamerule pvp false
gamerule falldamage true
gamerule drowningdamage true
gamerule firedamage true
effect @a instant_health 0 0 true
effect @a weakness 0 0 true