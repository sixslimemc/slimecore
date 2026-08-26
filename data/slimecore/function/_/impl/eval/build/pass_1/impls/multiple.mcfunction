# IMPL > slimecore:eval/build
# pass_1/impls/multiple

scoreboard players set *build.error _slimecore 1

execute unless data storage slimecore:out build.result.error.oversatisfied_contracts[0] run data modify storage slimecore:out build.result.error.oversatisfied_contracts set value []

# DEV: redundant variable {..err_entry}
data remove storage slimecore:_ v.build.err_entry
$data modify storage slimecore:_ v.build.err_entry set from storage slimecore:out build.result.error.oversatisfied_contracts[{contract:{pack_ref:'$(pack_ref)', id:'$(id)'}}]
# new entry:
execute unless data storage slimecore:_ v.build.err_entry run function slimecore:_/impl/eval/build/pass_1/impls/multiple.1

# update existing:
data modify storage slimecore:_ v.build.satisfiers_entry set value {}
data modify storage slimecore:_ v.build.satisfiers_entry.pack_ref set from storage slimecore:_ v.build.this_pack.pack_id
$data modify storage slimecore:out build.result.error.oversatisfied_contracts[{of:{pack_ref:'$(pack_ref)', id:'$(id)'}}].satisfiers append from storage slimecore:_ v.build.satisfiers_entry