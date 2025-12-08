# IMPL > slimecore:rebuild
# disables/remove_pack
#--------------------
# ./each
#--------------------

$data remove storage slimecore:_ v.rebuild.packs[{pack_id:"$(pack_ref)"}]
$execute if data storage slimecore:_ v.rebuild.old_data.build.aux.pack_map.'$(pack_ref)' unless data storage slimecore:_ v.rebuild.stored_disables[{pack_ref:"$(pack_ref)"}] unless data storage slimecore:in rebuild.uninstall[{pack_ref:"$(pack_ref)"}] run data modify storage slimecore:_ v.rebuild.stored_disables append value {pack_ref:"$(pack_ref)"}