# IMPL > slimecore:rebuild
# main

data remove storage slimecore:_ v.rebuild

# DEBUG
data modify storage slimecore:config build_time_gamerules set value {max_command_forks:19999, max_command_sequence_length:19999}

# set gamerules:
function slimecore:_/impl/rebuild/set_gamerules with storage slimecore:config build_time_gamerules

