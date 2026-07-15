# IMPL > slimecore:rebuild
# set_data/do
#--------------------
# ../process
#--------------------

data modify storage slimecore:_ v.rebuild.new_installed set value []
data modify storage slimecore:_ v.rebuild.new_installed_map set value {}

# set {..new_installed} and {..new_installed_map}
data modify storage slimecore:_ v.rebuild.install_entries set from storage slimecore:_ v.rebuild.new_disabled
execute if data storage slimecore:_ v.rebuild.install_entries[0] run data modify storage slimecore:_ v.rebuild.install_entries[]._disabled set value true
data modify storage slimecore:_ v.rebuild.install_entries append from storage slimecore:_ v.rebuild.build.packs[]
execute if data storage slimecore:_ v.rebuild.install_entries[0] run function slimecore:_/impl/rebuild/set_data/install_entries/each

# data sets:
data modify storage slimecore:data build set from storage slimecore:_ v.rebuild.build
data modify storage slimecore:data world.installed set from storage slimecore:_ v.rebuild.new_installed
data modify storage slimecore:data world.aux.installed_map set from storage slimecore:_ v.rebuild.new_installed_map

# unset safe mode:
data remove storage slimecore:data world.safe_mode
scoreboard players reset *safe_mode _slimecore

# update rebuild check:
function slimecore:_/get_manifests
data modify storage slimecore:_ data.rebuild_check.manifests set from storage slimecore:_ data.manifest_packs