execute as @s[tag=hunter,tag=game_is_running,scores={compass_cd=0}] run execute as @a[tag=speedrunner,tag=game_is_running] run setworldspawn
execute as @s[tag=hunter,tag=game_is_running,scores={compass_cd=0}] run tellraw @s {"rawtext":[{"text":"§cYou are tracking: §r§l"}, {"selector": "@a[tag=speedrunner,tag=game_is_running]"}]}
execute as @s[tag=!hunter,tag=game_is_running,scores={compass_cd=0}] run tellraw @s { "rawtext": [ { "text": "§cError: §rYou are not allowed to have compass in your inventory.\n§cCode: §rnot_a_hunter" } ] }
execute as @s[tag=!hunter,tag=game_is_running,scores={compass_cd=0}] run clear @s compass
execute as @s[tag=speedrunner,tag=hunter,tag=game_is_running,scores={compass_cd=0}] run tellraw @s { "rawtext": [ { "text": "§cError: §rYou are not allowed to have compass in your inventory.\n§cCode: §rhas_muitiple_identity" } ] }
execute as @s[tag=speedrunner,tag=hunter,tag=game_is_running,scores={compass_cd=0}] run clear @s compass
execute as @s[tag=game_is_running,scores={compass_cd=0}] run scoreboard players set @s compass_cd 20