# IMPL > slimecore:rebuild
# remaining_disables/each.1

$data modify storage slimecore:_/in get_linked_path.pack set from storage slimecore:_ data.manifest_packs[{pack_id:'$(pack_ref)'}]
function slimecore:_/util/get_linked_path/main

data modify storage slimecore:_ v.rebuild.this_disable.path set from storage slimecore:_/out get_linked_path.path

$data modify storage slimecore:_ v.rebuild.path_map.'$(pack_ref)' set from storage slimecore:_ v.rebuild.this_disable.path

function slimecore:_/impl/rebuild/disable with storage slimecore:_ v.rebuild.this_disable