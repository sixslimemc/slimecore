# IMPL > slimecore:rebuild
# new_packs/missing_path
#--------------------
# ./each
#--------------------

scoreboard players set *rebuild.error _slimecore 1

data modify storage slimecore:_ x.entry set value {}
data modify storage slimecore:_ x.entry.pack_ref set from storage slimecore:_ v.rebuild.this_pack.pack_id
execute if data storage slimecore:_ v.rebuild.override_path run data modify storage slimecore:_ x.entry.path_override set from storage slimecore:_ v.rebuild.override_path
data modify storage slimecore:out rebuild.result.error.missing_datapack_paths append from storage slimecore:_ x.entry