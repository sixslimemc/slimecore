# IMPL > slimecore:rebuild
# main

# reset incase build interrupted:
data remove storage slimecore:_ v.rebuild

# DEBUG
data modify storage slimecore:config build_time_gamerules set value {max_command_forks:19999, max_command_sequence_length:19999}

# set gamerule overrides and store {..gamerules}
function slimecore:_/impl/rebuild/set_gamerules with storage slimecore:config build_time_gamerules

function slimecore:_/impl/rebuild/process

# restore gamerules:
function slimecore:_/impl/rebuild/set_gamerules with storage slimecore:_ v.rebuild.gamerules
