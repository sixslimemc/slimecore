# IMPL > slimecore:rebuild
# in_disables/missing
#--------------------
# ./each.1
#--------------------

scoreboard players set *rebuild.error _slimecore 1

data modify storage slimecore:out rebuild.result.error.missing_datapack_paths append value {pack:{}}
data modify storage slimecore:out rebuild.result.error.missing_datapack_paths[-1].pack set from storage slimecore:_ v.rebuild.partial_pack
data modify storage slimecore:out rebuild.result.error.missing_datapack_paths[-1].path_override set from storage slimecore:_ v.rebuild.linked_out.path_override
