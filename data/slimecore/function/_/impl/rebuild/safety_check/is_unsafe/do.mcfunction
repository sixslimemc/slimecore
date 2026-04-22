# IMPL > slimecore:rebuild
# safety_check/is_unsafe/do
#--------------------
# ../do
#--------------------
# must return 0.

data modify storage slimecore:_ v.rebuild.seen_unsafe_map set value {}
data modify storage slimecore:_ v.rebuild.unsafe_calls set value []

# - populate {..unsafe_calls}
data modify storage slimecore:_ v.rebuild.unsafes set from storage slimecore:out rebuild.result.error.safe_mode_activated.duplicate_installed_pack_ids
execute if data storage slimecore:_ v.rebuild.unsafes[0] run function slimecore:_/impl/rebuild/safety_check/is_unsafe/unsafes/each

# set data:
data modify storage slimecore:data world.safe_mode.calls set from storage slimecore:_ v.rebuild.unsafe_calls
data modify storage slimecore:data world.safe_mode.enabled set value true
scoreboard players set *safe_mode _slimecore 1

return 0