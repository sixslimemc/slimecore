# IMPL > slimecore:eval/build
# pass_1/duplicate

scoreboard players set *build.error _slimecore 1

execute unless data storage slimecore:out build.result.error.duplicate_pack_ids[0] run data modify storage slimecore:out build.result.error.duplicate_pack_ids set value [] 

$execute unless data storage slimecore:out build.result.error.duplicate_pack_ids[{pack_id:'$(pack_id)'}] run function slimecore:_/impl/eval/build/pass_1/duplicate.1 with storage slimecore:_ v.build.this_pack

$data modify storage slimecore:out build.result.error.duplicate_pack_ids[{pack_id:'$(pack_id)'}].packs append from storage slimecore:_ v.build.this_pack