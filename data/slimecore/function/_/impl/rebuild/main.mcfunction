# IMPL > slimecore:rebuild
# main

# set gamerules:
data modify storage slimecore:_ data.gamerule_cache set from storage slimecore:config build_time_gamerules
function slimecore:_/util/set_gamerules/main

# restore gamerules in 1 tick:
schedule function slimecore:_/util/set_gamerules/main 1t

data remove storage slimecore:_ v.rebuild
scoreboard players set *just_rebuilt _slimecore 1

# DEBUG
tellraw @a {text:">> REBUILDING", color:"blue"}

# process:
execute store result score *rebuild.success _slimecore run function slimecore:_/impl/rebuild/process

# remove success if error & vice versa:
execute unless score *rebuild.success _slimecore matches 1 run data remove storage slimecore:out rebuild.result.success
execute if score *rebuild.success _slimecore matches 1 run data remove storage slimecore:out rebuild.result.error

# DEBUG
execute if score *rebuild.success _slimecore matches 1 run tellraw @a {text:">> REBUILD SUCCESS", color:"green"}

# DEBUG
execute unless score *rebuild.success _slimecore matches 1 run tellraw @a {text:">> REBUILD ERROR", color:"dark_red"}
execute unless score *rebuild.success _slimecore matches 1 run tellraw @a {storage:"slimecore:out", nbt:"rebuild.result.error", color:"red"}

reload
return run scoreboard players get *rebuild.success _slimecore
