# IMPL > slimecore:rebuild
# set_data/install_entries/each
#--------------------
# ../do
#--------------------

data modify storage slimecore:_ v.rebuild.this_manifest set from storage slimecore:_ v.rebuild.install_entries[-1]

function slimecore:_/impl/rebuild/set_data/install_entries/each.1 with storage slimecore:_ v.rebuild.this_manifest

data remove storage slimecore:_ v.rebuild.install_entries[-1]
execute if data storage slimecore:_ v.rebuild.install_entries[0] run function slimecore:_/impl/rebuild/set_data/install_entries/each