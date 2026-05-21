# IMPL > slimecore:rebuild
# set_data/install_entries/each
#--------------------
# ../do
#--------------------

data modify storage slimecore:_ v.rebuild.this_install set value {pack:{}, disabled:false, path:""}

execute if data storage slimecore:_ v.rebuild.this_manifest{_disabled:true} run data modify storage slimecore:_ v.rebuild.this_install.disabled set value true
data remove storage slimecore:_ v.rebuild.this_manifest._disabled

data modify storage slimecore:_ v.rebuild.this_install.pack set from storage slimecore:_ v.rebuild.this_manifest
$data modify storage slimecore:_ v.rebuild.this_install.path set from storage slimecore:_ v.rebuild.path_map.'$(pack_id)'

data modify storage slimecore:_ v.rebuild.new_installed append from storage slimecore:_ v.rebuild.this_install

$data modify storage slimecore:_ v.rebuild.new_installed_map.'$(pack_id)' set from storage slimecore:_ v.rebuild.this_install
