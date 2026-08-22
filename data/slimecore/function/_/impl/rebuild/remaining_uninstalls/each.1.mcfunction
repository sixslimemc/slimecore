# IMPL > slimecore:rebuild
# remaining_uninstalls/each.1

$data modify storage slimecore:_ v.rebuild.this_uninstall.path set from storage slimecore:_ v.rebuild.path_map.'$(pack_ref)'
function slimecore:_/impl/rebuild/uninstall with storage slimecore:_ v.rebuild.this_uninstall