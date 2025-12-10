# IMPL > slimecore:rebuild
# process
#--------------------
# ./main
#--------------------

data modify storage slimecore:out rebuild.result set value {success:{uninstall_paths:[]}, error:{}}
data modify storage slimecore:_ v.rebuild.new_world set value {disabled_packs:[], aux:{datapack_path_map:{}}}

# re-enable all packs:
data modify storage slimecore:_ v.rebuild.old_disabled set from storage slimecore:data world.disabled_packs
execute if data storage slimecore:_ v.rebuild.old_disabled[0] run function slimecore:_/impl/rebuild/old_disabled/each

# manifests:
data modify storage slimecore:_ data.manifest_packs set value []
scoreboard players set *manifest_time _slimecore 1
function #slimecore:manifest

# DEBUG
function slimecore:_/test_manifests

scoreboard players reset *manifest_time _slimecore



