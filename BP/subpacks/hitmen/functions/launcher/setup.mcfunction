# change players settings
scoreboard objectives add players dummy
scoreboard objectives add compass_cd dummy
scoreboard objectives add time_t dummy
scoreboard objectives add time_s dummy
scoreboard objectives add time_m dummy
scoreboard objectives add speedrunners dummy
scoreboard objectives add hunters dummy
scoreboard objectives add graceperiod dummy
scoreboard objectives add gptimer dummy
clear @a
clearspawnpoint @a
setworldspawn ~ ~ ~
spawnpoint @a ~ ~ ~
spreadplayers ~ ~ 1 10 @a
gamemode a @a
scoreboard players set @s graceperiod 0

# changes gamerule settings
gamerule naturalregeneration true
gamerule dodaylightcycle true
gamerule doimmediaterespawn false
gamerule showcoordinates true
gamerule spawnradius 10
gamerule sendcommandfeedback false
gamerule pvp false
gamerule falldamage false
gamerule drowningdamage false
gamerule firedamage false
time set 0

# tellraw message
tellraw @s {"rawtext":[{"text":"§aSetup complete."}]}
tellraw @s {"rawtext":[{"text":"―――――――――――――――――"}]}
tellraw @s {"rawtext":[{"text":"§cWhoever execute command §r§l/function start §r§cbecomes a speedrunner, and the rest are hunters."}]}
tellraw @s {"rawtext":[{"text":"§ePlease make sure that you do NOT leave until the game ends, or the game will corrupt."}]}
tellraw @s {"rawtext":[{"text":"―――――――――――――――――"}]}
tellraw @s {"rawtext":[{"text":"§aMore info at: §bhttps://jaylydev.github.io/posts/minecraft-manhunt/"}]}
tellraw @s {"rawtext":[{"text":"§aSupport Discord Server: §bhttps://discord.gg/8xzSHD84xv"}]}
tag @s add host
tag @s add verified
tag @s remove user

# TIMER
scoreboard players set @s[tag=host] time_t 0
scoreboard players set @s[tag=host] time_s 0
scoreboard players set @s[tag=host] time_m 60