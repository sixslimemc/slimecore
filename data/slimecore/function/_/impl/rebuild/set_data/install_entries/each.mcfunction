# IMPL > slimecore:rebuild
# set_data/install_entries/each
#--------------------
# ../do
#--------------------

data modify storage slimecore:_ v.rebuild.this_manifest set from storage slimecore:_ v.rebuild.install_entries[-1]

data modify storage slimecore:_ v.rebuild.this_install set value {pack:{}, disabled:false}
execute if data storage slimecore:_ v.rebuild.this_manifest{_disabled:true} run data modify storage slimecore:_ v.rebuild.this_install.disabled set value true

data remove storage slimecore:_ v.rebuild.this_manifest._disabled
data modify storage slimecore:_ v.rebuild.this_install.pack set from storage slimecore:_ v.rebuild.this_manifest

data modify storage slimecore:_ v.rebuild.new_installed append from storage slimecore:_ v.rebuild.this_install

data modify storage slimecore:_ x.mline set value {1:"data modify storage slimecore:_ v.rebuild.new_installed_map.'", 2:true, 3:"' set from storage slimecore:_ v.rebuild.this_install"}
data modify storage slimecore:_ x.mline.2 set from storage slimecore:_ v.rebuild.this_manifest.pack_id
function slimecore:_/util/mline/3 with storage slimecore:_ x.mline

data remove storage slimecore:_ v.rebuild.install_entries[-1]
execute if data storage slimecore:_ v.rebuild.install_entries[0] run function slimecore:_/impl/rebuild/set_data/install_entries/each