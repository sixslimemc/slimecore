# IMPL > slimecore:rebuild
# path_linking/is_unsafe
#--------------------
# ./do
#--------------------

data remove storage slimecore:data world.safe_mode

# set unsafe calls:
data modify storage slimecore:_/in get_unsafe_calls.unsafes set value []
data modify storage slimecore:_/in get_unsafe_calls.unsafes append from storage slimecore:out rebuild.result.error.safe_mode_activated.misloaded_datapacks_missing_path[].pack
function slimecore:_/util/get_unsafe_calls/main
data modify storage slimecore:data world.safe_mode.calls set from storage slimecore:_/out get_unsafe_calls.result

# set reason:
data modify storage slimecore:data world.safe_mode.reason.misloaded_datapacks_missing_path set from storage slimecore:out rebuild.result.error.safe_mode_activated.misloaded_datapacks_missing_path

scoreboard players set *safe_mode _slimecore 1
