# UTIL > slimecore:_/util/set_gamerules
# do
#--------------------
# ./main
#--------------------

execute store result storage slimecore:_ data.gamerule_cache.max_command_forks int 1 run gamerule minecraft:max_command_forks
execute store result storage slimecore:_ data.gamerule_cache.max_command_sequence_length int 1 run gamerule minecraft:max_command_sequence_length

$gamerule minecraft:max_command_forks $(max_command_forks)
$gamerule minecraft:max_command_sequence_length $(max_command_sequence_length)
