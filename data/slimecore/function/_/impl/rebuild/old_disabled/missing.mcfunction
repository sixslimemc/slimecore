# IMPL > slimecore:rebuild
# old_disabled/missing
#--------------------
# ./each
#--------------------

scoreboard players set *rebuild.error _slimecore 1

data modify storage slimecore:_ x.error_entry set value {}
data modify storage slimecore:_ x.error_entry.pack set from storage slimecore:_ v.rebuild.this_disable
data modify storage slimecore:_ x.error_entry.path_override set from storage slimecore:_ v.rebuild.linked_out.path_override
data modify storage slimecore:out rebuild.result.error.missing_datapack_paths append from storage slimecore:_ x.error_entry
