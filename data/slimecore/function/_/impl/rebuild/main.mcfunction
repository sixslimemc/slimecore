# IMPL > slimecore:rebuild
# main

# reset incase build interrupted:
data remove storage slimecore:_ v.rebuild

# DEBUG
data modify storage slimecore:config build_time_gamerules set value {max_command_forks:19999, max_command_sequence_length:19999}

# set gamerule overrides and store {..gamerules}
function slimecore:_/impl/rebuild/set_gamerules with storage slimecore:config build_time_gamerules

execute store result score *rebuild.success _slimecore run function slimecore:_/impl/rebuild/process
execute if score *rebuild.success _slimecore matches 1 run data modify storage slimecore:out rebuild.result set value {success:true}

# restore gamerules:
function slimecore:_/impl/rebuild/set_gamerules with storage slimecore:_ v.rebuild.gamerules

return run scoreboard players get *rebuild.success _slimecore