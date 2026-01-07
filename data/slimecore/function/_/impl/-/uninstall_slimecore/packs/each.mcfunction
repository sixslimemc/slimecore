# IMPL > slimecore:-/uninstall_slimecore
# packs/each
#--------------------
# ../main
#--------------------

data modify storage slimecore:_ v.uninstall.this_pack set from storage slimecore:_ v.uninstall.packs[-1]

function slimecore:_/impl/-/uninstall_slimecore/packs/each.1 with storage slimecore:_ v.uninstall.this_pack

data remove storage slimecore:_ v.uninstall.packs[-1]
execute if data storage slimecore:_ v.uninstall.packs[0] run function slimecore:_/impl/-/uninstall_slimecore/packs/each