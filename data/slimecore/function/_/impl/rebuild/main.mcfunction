# IMPL > slimecore:rebuild
# main

data remove storage slimecore:_ v.rebuild

# DEBUG
data modify storage slimecore:config build_time_gamerules set value {max_command_forks:19999, max_command_sequence_length:19999}

# set gamerules:
function slimecore:_/impl/rebuild/set_gamerules with storage slimecore:config build_time_gamerules

execute store result score *rebuild.success _slimecore run function slimecore:_/impl/rebuild/process

# restore gamerules:
function slimecore:_/impl/rebuild/set_gamerules with storage slimecore:_ v.rebuild.gamerules



# DEV/LEFTOFF
#- i dont even think we need phases?
# we can just do the full rebuild and load and then ignore the next '_/reload' call.
# '_/reload' either rebuilds OR loads, rebuild should call load within it.
# again, i don't think we need phases, we can just do everything in 1 cycle.