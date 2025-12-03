# IMPL > slimecore:eval/build
# pass_1/impls/multiple

scoreboard players set *build.error _slimecore 1

execute unless data storage slimecore:out build.result.error.multiple_implementations[0] run data modify storage slimecore:out build.result.error.multiple_implementations set value []

# DEV: redundant variable {..err_entry}
data remove storage slimecore:_ v.build.err_entry
$data modify storage slimecore:_ v.build.err_entry set from storage slimecore:out build.result.error.multiple_implementations[{of:{pack_ref:'$(pack_ref)', id:'$(id)'}}]
# new entry:
execute unless data storage slimecore:_ v.build.err_entry run function slimecore:_/impl/eval/build/pass_1/impls/multiple.1

# update existing:
data modify storage slimecore:_ v.build.from_entry set value {}
data modify storage slimecore:_ v.build.from_entry.pack_ref set from storage slimecore:_ v.build.this_pack.pack_id
$data modify storage slimecore:out build.result.error.multiple_implementations[{of:{pack_ref:'$(pack_ref)', id:'$(id)'}}].from append from storage slimecore:_ v.build.from_entry