# IMPL > slimecore:rebuild
# packs/missing
#--------------------
# ./each
#--------------------

scoreboard players set *rebuild.error _slimecore 1

data modify storage slimecore:out rebuild.result.error.missing_datapack_paths append value {for:{}}
data modify storage slimecore:out rebuild.result.error.missing_datapack_paths[-1].for set from storage slimecore:_ v.rebuild.this_pack
data modify storage slimecore:out rebuild.result.error.missing_datapack_paths[-1].path_override set from storage slimecore:_ v.rebuild.linked_out.path_override
