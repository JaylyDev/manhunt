scoreboard objectives add players dummy
tag @s add user
execute as @a run execute as @a[tag=user] run scoreboard players set @s players 0
execute as @a run execute as @a[tag=user] run scoreboard players add @s players 1
execute as @s[tag=user,tag=!verified,scores={players=..1}] run function launcher/setup