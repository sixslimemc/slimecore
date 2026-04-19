# IMPL > slimecore:rebuild
# in_uninstalls/missing
#--------------------
# ./each.1
#--------------------

scoreboard players set *rebuild.error _slimecore 1

data modify storage slimecore:_ x.err_entry set value {}
data modify storage slimecore:_ x.err_entry.pack set from storage slimecore:_ v.rebuild.partial_pack
data modify storage slimecore:_ x.err_entry.path_override set from storage slimecore:_ v.rebuild.linked_out.path_override
data modify storage slimecore:out rebuild.result.error.missing_datapack_paths append from storage slimecore:_ x.err_entry
