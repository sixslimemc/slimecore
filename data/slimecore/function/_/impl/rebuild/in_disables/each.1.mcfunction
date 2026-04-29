# IMPL > slimecore:rebuild
# in_disables/each.1

data remove storage slimecore:_ v.rebuild.disable_pack
$data modify storage slimecore:_ v.rebuild.disable_pack set from storage slimecore:_ data.manifest_packs[{pack_id:'$(pack_ref)'}]
$execute if data storage slimecore:_ v.rebuild.disabling[{pack_ref:'$(pack_ref)'}] run return 0
execute unless data storage slimecore:_ v.rebuild.disable_pack run return 0
execute if data storage slimecore:_ v.rebuild.disable_pack[0] run return 0

$data remove storage slimecore:_ v.rebuild.build_packs[{pack_id:'$(pack_ref)'}]

data modify storage slimecore:_/in get_linked_path.pack set from storage slimecore:_ v.rebuild.disable_pack
execute store result score *x _slimecore run function slimecore:_/util/get_linked_path/main
data modify storage slimecore:_ v.rebuild.linked_out set from storage slimecore:_/out get_linked_path

execute unless score *x _slimecore matches 1 run return run function slimecore:_/impl/rebuild/in_disables/missing

data modify storage slimecore:_ v.rebuild.new_disabled append from storage slimecore:_ v.rebuild.disable_pack

data modify storage slimecore:_ x.entry set value {pack_ref:"", path:"", call_tag:true}
data modify storage slimecore:_ x.entry.pack_ref set from storage slimecore:_ v.rebuild.this_disable.pack_ref
data modify storage slimecore:_ x.entry.path set from storage slimecore:_ v.rebuild.linked_out.path
$execute if data storage slimecore:data world.aux.installed_map.'$(pack_ref)'{disabled:true} run data modify storage slimecore:_ x.entry.call_tag set value false
data modify storage slimecore:_ v.rebuild.disabling append from storage slimecore:_ x.entry

