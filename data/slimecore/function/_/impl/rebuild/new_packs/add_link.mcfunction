# IMPL > slimecore:rebuild
# new_packs/add_link
#--------------------
# ./each
#--------------------

data modify storage slimecore:_ x.entry set value {}
data modify storage slimecore:_ x.entry.pack_ref set from storage slimecore:_ v.rebuild.this_pack.pack_id
data modify storage slimecore:_ x.entry.datapack_path set from storage slimecore:_ v.rebuild.linked_path
data modify storage slimecore:_ v.rebuild.new_data.world.datapack_links append from storage slimecore:_ x.entry
$data modify storage slimecore:_ v.rebuild.new_data.world.aux.datapack_link_map.'$(pack_id)' set from storage slimecore:_ v.rebuild.linked_path