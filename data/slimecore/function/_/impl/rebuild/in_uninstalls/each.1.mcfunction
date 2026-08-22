# IMPL > slimecore:rebuild
# in_uninstalls/each.1

data remove storage slimecore:_ v.rebuild.uninstall_pack
$data modify storage slimecore:_ v.rebuild.uninstall_pack set from storage slimecore:_ data.manifest_packs[{pack_id:'$(pack_ref)'}]
$execute if data storage slimecore:_ v.rebuild.uninstalling[{pack_ref:'$(pack_ref)'}] run return 0
execute unless data storage slimecore:_ v.rebuild.uninstall_pack run return 0
execute if data storage slimecore:_ v.rebuild.uninstall_pack[0] run return 0

# DEBUG:
tellraw @a ["UNINSTALL: ", {'storage':'slimecore:_', 'nbt':'v.rebuild.uninstall_pack'}]

$data remove storage slimecore:in rebuild.disable[{pack_ref:'$(pack_ref)'}]
$data remove storage slimecore:_ v.rebuild.build_packs[{pack_id:'$(pack_ref)'}]

data modify storage slimecore:_ x.entry set value {pack_ref:"", call_disable:true}
data modify storage slimecore:_ x.entry.pack_ref set from storage slimecore:_ v.rebuild.this_uninstall.pack_ref
$execute if data storage slimecore:data world.aux.installed_map.'$(pack_ref)'{disabled:true} run data modify storage slimecore:_ x.entry.call_disable set value false
data modify storage slimecore:_ v.rebuild.uninstalling append from storage slimecore:_ x.entry