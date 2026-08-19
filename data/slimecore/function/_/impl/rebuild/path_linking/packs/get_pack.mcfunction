# IMPL > slimecore:rebuild
# path_linking/packs/mark
#--------------------
# ./each
#--------------------

$data modify storage slimecore:_ v.rebuild.this_pack set from storage slimecore:_ data.manifest_packs[{pack_id:"$(pack_id)"}]
$data remove storage slimecore:_ v.rebuild.unloading_packs[{pack_id:"$(pack_id)"}]