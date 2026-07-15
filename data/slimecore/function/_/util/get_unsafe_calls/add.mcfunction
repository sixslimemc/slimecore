# UTIL > slimecore :_/util/ get_unsafe_calls
# add
#--------------------
# ./loop
#--------------------

# return if seen:
$execute store success score *x _slimecore run data modify storage slimecore:_ u.get_unsafe_calls.seen_map.'$(pack_id)' set value true
execute if score *x _slimecore matches 0 run return 0

# get currently in-build manifest:
data remove storage slimecore:_ u.get_unsafe_calls.this_build_manifest
$data modify storage slimecore:_ u.get_unsafe_calls.this_build_manifest set from storage slimecore:data build.aux.pack_map.'$(pack_id)'
execute unless data storage slimecore:_ u.get_unsafe_calls.this_build_manifest run return 0

# add entry for this unsafe:
data modify storage slimecore:_/out get_unsafe_calls.result append value {pack_ref:""}
data modify storage slimecore:_/out get_unsafe_calls.result[-1].pack_ref set from storage slimecore:_ u.get_unsafe_calls.this_unsafe.pack_id

# add dependents to unsafes:
$data modify storage slimecore:_ u.get_unsafe_calls.unsafes prepend from storage slimecore:data build.packs[{dependencies:[{pack_id:"$(pack_id)"}]}]