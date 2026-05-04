# IMPL > slimecore:-/uninstall_slimecore
# packs/each
#--------------------
# ../confirm
#--------------------

data modify storage slimecore:_ t.uninstall.this_pack set from storage slimecore:_ t.uninstall.packs[-1]

# get {..path}:
data modify storage slimecore:_/in get_linked_path.pack set from storage slimecore:_ t.uninstall.this_pack
function slimecore:_/util/get_linked_path/main
data modify storage slimecore:_ t.uninstall.path set from storage slimecore:_/out get_linked_path.path

# disable call:
data modify storage slimecore:_ t.uninstall.pack_id set from storage slimecore:_ t.uninstall.this_pack.pack_id
function slimecore:_/impl/-/uninstall_slimecore/packs/call with storage slimecore:_ t.uninstall

data remove storage slimecore:_ t.uninstall.packs[-1]
execute if data storage slimecore:_ t.uninstall.packs[0] run function slimecore:_/impl/-/uninstall_slimecore/packs/each
