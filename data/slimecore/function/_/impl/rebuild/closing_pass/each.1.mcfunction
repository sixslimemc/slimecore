# IMPL > slimecore:rebuild
# closing_pass/each.1

data remove storage slimecore:_ v.rebuild.disable_entry
$data modify storage slimecore:_ v.rebuild.disable_entry set from storage slimecore:_ v.rebuild.disabling[{pack_ref:"$(pack_ref)"}]
$data remove storage slimecore:_ v.rebuild.disabling[{pack_ref:"$(pack_ref)"}]
execute if data storage slimecore:_ v.rebuild.disable_entry run return run function slimecore:_/impl/rebuild/disable with storage slimecore:_ v.rebuild.disable_entry

data remove storage slimecore:_ v.rebuild.uninstall_entry
$data modify storage slimecore:_ v.rebuild.uninstall_entry set from storage slimecore:_ v.rebuild.uninstalling[{pack_ref:"$(pack_ref)"}]
$data remove storage slimecore:_ v.rebuild.uninstalling[{pack_ref:"$(pack_ref)"}]
execute if data storage slimecore:_ v.rebuild.uninstall_entry run return run function slimecore:_/impl/rebuild/uninstall with storage slimecore:_ v.rebuild.uninstall_entry

