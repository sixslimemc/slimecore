# IMPL > slimecore:rebuild
# remaining_disables/each.1

$data modify storage slimecore:_ v.rebuild.this_disable.path set from storage slimecore:_ v.rebuild.path_map.'$(pack_ref)'
function slimecore:_/impl/rebuild/disable with storage slimecore:_ v.rebuild.this_disable