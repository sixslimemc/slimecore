# IMPL > slimecore:rebuild
# safety_check/is_unsafe/unsafes/each.1

# return if already seen:
$execute store success score *x _slimecore run data modify storage slimecore:_ v.rebuild.seen_unsafe_map.'$(pack_id)' set value true
execute if score *x _slimecore matches 0 run return 0

# get in-build manifest:
data remove storage slimecore:_ v.rebuild.build_manifest
$data modify storage slimecore:_ v.rebuild.build_manifest set from storage slimecore:data build.aux.pack_map.'$(pack_id)'
execute unless data storage slimecore:_ v.rebuild.build_manifest run return 0

# add this entry:
data modify storage slimecore:_ v.rebuild.unsafe_calls append value {pack_ref:""}
data modify storage slimecore:_ v.rebuild.unsafe_calls[-1].pack_ref set from storage slimecore:_ v.rebuild.this_unsafe.pack_id

# add dependencies to iterator {..unsafes}
execute if data storage slimecore:_ v.rebuild.build_manifest.dependencies[0] run function slimecore:_/impl/rebuild/safety_check/is_unsafe/unsafes/dependencies/each

