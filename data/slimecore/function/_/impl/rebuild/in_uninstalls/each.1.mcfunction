# IMPL > slimecore:rebuild
# in_uninstalls/each.1

# garunteed to be a PartialPackInfo
data remove storage slimecore:_ v.rebuild.uninstall_pack
$data modify storage slimecore:_ v.rebuild.uninstall_pack set from storage slimecore:_ data.manifest_packs[{pack_id:'$(pack_ref)'}]
$execute if data storage slimecore:_ v.rebuild.uninstalling[{pack_ref:'$(pack_ref)'}] run return 0
execute unless data storage slimecore:_ v.rebuild.uninstall_pack run return 0
execute if data storage slimecore:_ v.rebuild.uninstall_pack[0] run return 0

$data remove storage slimecore:in rebuild.disable[{pack_ref:'$(pack_ref)'}]
$data remove storage slimecore:_ v.rebuild.build_packs[{pack_ref:'$(pack_ref)'}]

data remove storage slimecore:_ v.rebuild.partial_pack
data modify storage slimecore:_ v.rebuild.partial_pack.pack_id set from storage slimecore:_ v.rebuild.uninstall_pack.pack_id
data modify storage slimecore:_ v.rebuild.partial_pack.author_id set from storage slimecore:_ v.rebuild.uninstall_pack.author_id
data modify storage slimecore:_ v.rebuild.partial_pack.version set from storage slimecore:_ v.rebuild.uninstall_pack.version
data modify storage slimecore:_/in get_linked_path.pack set from storage slimecore:_ v.rebuild.partial_pack
execute store result score *x _slimecore run function slimecore:_/util/get_linked_path/main
data modify storage slimecore:_ v.rebuild.linked_out set from storage slimecore:_/out get_linked_path

execute unless score *x _slimecore matches 1 run return run function slimecore:_/impl/rebuild/in_uninstalls/missing

data modify storage slimecore:_ x.entry set value {pack_ref:"", path:""}
data modify storage slimecore:_ x.entry.pack_ref set from storage slimecore:_ v.rebuild.this_uninstall.pack_ref
data modify storage slimecore:_ x.entry.path set from storage slimecore:_ v.rebuild.linked_out.path
data modify storage slimecore:_ v.rebuild.uninstalling append from storage slimecore:_ x.entry