# IMPL > slimecore:rebuild
# packs/add_link
#--------------------
# ./each
#--------------------

data modify storage slimecore:_ x.entry set value {pack_ref:"", path:""}
data modify storage slimecore:_ x.entry.pack_ref set from storage slimecore:_ v.rebuild.this_pack.pack_id
data modify storage slimecore:_ x.entry.path set from storage slimecore:_ v.rebuild.linked_out.path
data modify storage slimecore:_ v.rebuild.new_links append from storage slimecore:_ x.entry

$data modify storage slimecore:_ v.rebuild.new_link_map.'$(pack_id)' set from storage slimecore:_ v.rebuild.linked_out.path