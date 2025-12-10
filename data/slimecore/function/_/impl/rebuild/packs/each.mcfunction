# IMPL > slimecore:rebuild
# packs/each
#--------------------
# ../process
#--------------------
# forward load order

data modify storage slimecore:_ v.rebuild.this_pack set value {pack_id:"", version:{}, author_id:""}
data modify storage slimecore:_ v.rebuild.this_pack.pack_id set from storage slimecore:_ v.rebuild.packs[0].pack_id
data modify storage slimecore:_ v.rebuild.this_pack.author_id set from storage slimecore:_ v.rebuild.packs[0].author_id
data modify storage slimecore:_ v.rebuild.this_pack.version set from storage slimecore:_ v.rebuild.packs[0].version

data modify storage slimecore:_/in get_linked_path.pack set from storage slimecore:_ v.rebuild.this_pack
execute store result score *rebuild.found_path _slimecore run function slimecore:_/util/get_linked_path/main
data modify storage slimecore:_ v.rebuild.linked_out set from storage slimecore:_/out get_linked_path

execute if score *rebuild.found_path _slimecore matches 1 run function slimecore:_/impl/rebuild/packs/add_link with storage slimecore:_ v.rebuild.this_pack
execute unless score *rebuild.found_path _slimecore matches 1 run function slimecore:_/impl/rebuild/packs/missing

data remove storage slimecore:_ v.rebuild.packs[0]
execute if data storage slimecore:_ v.rebuild.packs[0] run function slimecore:_/impl/rebuild/packs/each