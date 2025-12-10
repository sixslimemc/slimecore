# IMPL > slimecore:rebuild
# main

data remove storage slimecore:_ v.rebuild
scoreboard players set *ignore_reload _slimecore 1
# restore gamerules in 1 tick
schedule function slimecore:_/util/set_gamerules/main 1t

# set gamerules:
data modify storage slimecore:_ data.gamerule_cache set from storage slimecore:config build_time_gamerules
function slimecore:_/util/set_gamerules/main

# process:
execute store result score *rebuild.success _slimecore run function slimecore:_/impl/rebuild/process

# remove success if error:
execute unless score *rebuild.success _slimecore matches 1 run data remove storage slimecore:out rebuild.result.success

return run scoreboard players get *rebuild.success _slimecore
