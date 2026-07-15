# IMPL > slimecore:rebuild
# safety_check/is_unsafe
#--------------------
# ./do
#--------------------
# must return 0.

data remove storage slimecore:data world.safe_mode

data modify storage slimecore:_ v.rebuild.seen_unsafe_map set value {}
data modify storage slimecore:_ v.rebuild.unsafe_calls set value []

# set unsafe calls:
data modify storage slimecore:_/in get_unsafe_calls.unsafes set from storage slimecore:out rebuild.result.error.safe_mode_activated.duplicate_installed_pack_ids
function slimecore:_/util/get_unsafe_calls/main
data modify storage slimecore:data world.safe_mode.calls set from storage slimecore:_/out get_unsafe_calls.result

# set reason:
data modify storage slimecore:data world.safe_mode.reason.duplicate_installed_pack_ids set from storage slimecore:out rebuild.result.error.safe_mode_activated.duplicate_installed_pack_ids

scoreboard players set *safe_mode _slimecore 1

return 0