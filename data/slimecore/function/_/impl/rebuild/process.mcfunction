# IMPL > slimecore:rebuild
# process
#--------------------
# ./main
#--------------------

data modify storage slimecore:out rebuild.result set value {success:{uninstall_paths:[]}, error:{}}


data modify storage slimecore:_ v.rebuild.new_disabled set value []

# {pack_ref:PackId, path:DatpackPath, call_tag:boolean}
data modify storage slimecore:_ v.rebuild.disabling set value []

# {pack_ref:PackId, path:DatpackPath}
data modify storage slimecore:_ v.rebuild.uninstalling set value []

# re-enable all packs (for proper manifest gathering and disable/load calling):
data modify storage slimecore:_ v.rebuild.old_disabled set from storage slimecore:data world.disabled_packs
execute if data storage slimecore:_ v.rebuild.old_disabled[0] run function slimecore:_/impl/rebuild/old_disabled/each
execute if score *rebuild.error _slimecore matches 1 run return 0

# --- GET MANIFESTS ---
data modify storage slimecore:_ data.manifest_packs set value []
scoreboard players set *manifest_time _slimecore 1
function #slimecore:manifest

# DEBUG
function slimecore:_/test_manifests

scoreboard players reset *manifest_time _slimecore
# ---

#- populate {..uninstalling}
#~ uninstalls take precedence over disables
execute if data storage slimecore:in rebuild.uninstall[0] run function slimecore:_/impl/rebuild/in_uninstalls/each

#- populate {..disabling}
#- populate {..new_disabled}
#~ uninstalls take precedence over disables
execute if data storage slimecore:in rebuild.disable[0] run function slimecore:_/impl/rebuild/in_disables/each

