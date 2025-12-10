# IMPL > slimecore:rebuild
# main

data remove storage slimecore:_ v.rebuild
scoreboard players set *ignore_reload _slimecore 1
# restore gamerules in 1 tick
schedule function slimecore:_/util/set_gamerules/main 1t


# set gamerules:
# DEBUG
data modify storage slimecore:config build_time_gamerules set value {max_command_forks:19999, max_command_sequence_length:19999}
data modify storage slimecore:_ data.gamerule_cache set from storage slimecore:config build_time_gamerules
function slimecore:_/util/set_gamerules/main

execute store result score *rebuild.success _slimecore run function slimecore:_/impl/rebuild/process

execute unless score *rebuild.success _slimecore matches 1 run data remove storage slimecore:out rebuild.result.success

return run scoreboard players get *rebuild.success _slimecore



# DEV/LEFTOFF
#- i dont even think we need phases?
# we can just do the full rebuild and load and then ignore the next '_/reload' call.
# '_/reload' either rebuilds OR loads, rebuild should call load within it.
# again, i don't think we need phases, we can just do everything in 1 cycle.