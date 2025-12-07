#> slimecore:_/rebuild/set_gamerules
#--------------------
# ./main
#--------------------

execute store result storage slimecore:_ var.rebuild.gamerules.max_command_forks int 1 run gamerule minecraft:max_command_forks
execute store result storage slimecore:_ var.rebuild.gamerules.max_command_sequence_length int 1 run gamerule minecraft:max_command_sequence_length

$gamerule minecraft:max_command_forks $(max_command_forks)
$gamerule minecraft:max_command_sequence_length $(max_command_sequence_length)
