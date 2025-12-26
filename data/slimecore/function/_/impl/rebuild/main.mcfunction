# IMPL > slimecore:rebuild
# main

# set gamerules:
data modify storage slimecore:_ data.gamerule_cache set from storage slimecore:config build_time_gamerules
function slimecore:_/util/set_gamerules/main

# restore gamerules in 1 tick:
schedule function slimecore:_/util/set_gamerules/main 1t

data remove storage slimecore:_ v.rebuild
scoreboard players set *just_rebuilt _slimecore 1

# HOOK: info/rebuild/start
function #slimecore:hook/info/rebuild/start

# process:
execute store result score *rebuild.success _slimecore run function slimecore:_/impl/rebuild/process

# remove success if error & vice versa:
execute unless score *rebuild.success _slimecore matches 1 run data remove storage slimecore:out rebuild.result.success
execute if score *rebuild.success _slimecore matches 1 run data remove storage slimecore:out rebuild.result.error

# HOOK: info/rebuild/end
data modify storage slimecore:hook end.result set from storage slimecore:out rebuild.result
function #slimecore:hook/info/rebuild/end

reload
return run scoreboard players get *rebuild.success _slimecore
