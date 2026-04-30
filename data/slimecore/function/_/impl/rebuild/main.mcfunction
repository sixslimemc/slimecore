# IMPL > slimecore:rebuild
# main

# set gamerules:
data modify storage slimecore:_ data.gamerule_cache set from storage slimecore:config build_time_gamerules
function slimecore:_/util/set_gamerules/main

# restore gamerules in 1 tick:
schedule function slimecore:_/util/set_gamerules/main 1t

# DEV: unsure why this was put here and not in public tail, tentatively removing.
# (may have been because rebuilding was initially a multi-tick process)
# data remove storage slimecore:_ v.rebuild

scoreboard players set *just_rebuilt _slimecore 1

# HOOK: meta_info/rebuild/start
function #slimecore:hook/meta_info/rebuild/start

# wipe old data if force clean:
execute if data storage slimecore:in rebuild{force_clean:true} run function slimecore:_/util/wipe_data/main

# check safety:
execute store result score *rebuild.success _slimecore run function slimecore:_/impl/rebuild/safety_check/do

# process:
# - populate {..post_disables}
data modify storage slimecore:_ v.rebuild.post_disables set value []
execute if score *rebuild.success _slimecore matches 1 store result score *rebuild.success _slimecore run function slimecore:_/impl/rebuild/process

# disable {..post_disables}:
# (logically should only run if rebuild fails)
execute if data storage slimecore:_ v.rebuild.post_disables[0] run function slimecore:_/impl/rebuild/post_disables/each

# remove success if error & vice versa:
execute unless score *rebuild.success _slimecore matches 1 run data remove storage slimecore:out rebuild.result.success
execute if score *rebuild.success _slimecore matches 1 run data remove storage slimecore:out rebuild.result.error

# HOOK: meta_info/rebuild/end
data modify storage slimecore:hook end.result set from storage slimecore:out rebuild.result
function #slimecore:hook/meta_info/rebuild/end

reload
return run scoreboard players get *rebuild.success _slimecore
