# IMPL > slimecore:rebuild
# path_linking/packs/missing
#--------------------
# ./each
#--------------------

scoreboard players set *rebuild.error _slimecore 1
scoreboard players set *rebuild.unsafe _slimecore 1

data modify storage slimecore:_ x.err_entry set value {}
data modify storage slimecore:_ x.err_entry.pack set from storage slimecore:_ v.rebuild.this_pack
data modify storage slimecore:_ x.err_entry.path_override set from storage slimecore:_ v.rebuild.linked_out.path_override
data modify storage slimecore:out rebuild.result.error.safe_mode_activated.misloaded_datapacks_missing_path append from storage slimecore:_ x.err_entry
