execute @a[tag=host,scores={players=2..}] ~~~ function system/lobby/mh_start
execute @a[tag=host,scores={players=..2}] ~~~ function system/lobby/mh_start_error

# This file will detect if 2+ players is here.
# If is, it will run function/system/lobby/mh_start.mcfunction
# else it runs the first one