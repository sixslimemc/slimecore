# IMPL > slimecore:eval/pack
# main

scoreboard players set *pack.error _slimecore 0

data modify storage slimecore:_ v.pack.key set value "dependencies"
data modify storage slimecore:_ v.pack.id_key set value "pack_id"
data modify storage slimecore:_ v.pack.dupe_checks set from storage slimecore:in pack.pack.dependencies
execute if data storage slimecore:_ v.pack.dupe_checks[0] run function slimecore:_/impl/eval/pack/dupe_check/each

data modify storage slimecore:_ v.pack.key set value "entrypoints"
data modify storage slimecore:_ v.pack.id_key set value "id"
data modify storage slimecore:_ v.pack.dupe_checks set from storage slimecore:in pack.pack.entrypoints
execute if data storage slimecore:_ v.pack.dupe_checks[0] run function slimecore:_/impl/eval/pack/dupe_check/each

data modify storage slimecore:_ v.pack.key set value "preload_entrypoints"
data modify storage slimecore:_ v.pack.id_key set value "id"
data modify storage slimecore:_ v.pack.dupe_checks set from storage slimecore:in pack.pack.preload_entrypoints
execute if data storage slimecore:_ v.pack.dupe_checks[0] run function slimecore:_/impl/eval/pack/dupe_check/each

data modify storage slimecore:_ v.pack.key set value "abstract_declarations"
data modify storage slimecore:_ v.pack.id_key set value "id"
data modify storage slimecore:_ v.pack.dupe_checks set from storage slimecore:in pack.pack.abstract_declarations
execute if data storage slimecore:_ v.pack.dupe_checks[0] run function slimecore:_/impl/eval/pack/dupe_check/each

data modify storage slimecore:_ v.pack.key set value "abstract_implementations"
data modify storage slimecore:_ v.pack.id_key set value "id"
data modify storage slimecore:_ v.pack.dupe_checks set from storage slimecore:in pack.pack.abstract_implementations
execute if data storage slimecore:_ v.pack.dupe_checks[0] run function slimecore:_/impl/eval/pack/dupe_check/each

execute if score *pack.error _slimecore matches 1 run return 0

data modify storage slimecore:_ v.pack.key set value "abstract_implementations"
data modify storage slimecore:_ v.pack.ref_checks set from storage slimecore:in pack.pack.abstract_implementations
execute if data storage slimecore:_ v.pack.ref_checks[0] run function slimecore:_/impl/eval/pack/ref_check/each

data modify storage slimecore:_ v.pack.entrypoint_key set value "entrypoints"
data modify storage slimecore:_ v.pack.entrypoints set from storage slimecore:in pack.pack.entrypoints
execute store result score *pack.index _slimecore if data storage slimecore:_ v.pack.entrypoints[]
execute if data storage slimecore:_ v.pack.entrypoints[0] run function slimecore:_/impl/eval/pack/entrypoints/each

data modify storage slimecore:_ v.pack.entrypoint_key set value "preload_entrypoints"
data modify storage slimecore:_ v.pack.entrypoints set from storage slimecore:in pack.pack.preload_entrypoints
execute store result score *pack.index _slimecore if data storage slimecore:_ v.pack.entrypoints[]
execute if data storage slimecore:_ v.pack.entrypoints[0] run function slimecore:_/impl/eval/pack/entrypoints/each

execute if score *pack.error _slimecore matches 1 run return 0

data modify storage slimecore:out pack.result.success set value true
return 1