# IMPL > slimecore:eval/pack
# entrypoints/each
#--------------------
# ../main
#--------------------

scoreboard players remove *pack.index _slimecore 1
data modify storage slimecore:_ v.pack.this_entrypoint set from storage slimecore:_ v.pack.entrypoints[-1]

function slimecore:_/impl/eval/pack/entrypoints/set_key {key:"before"}
data modify storage slimecore:_ v.pack.ref_checks set from storage slimecore:_ v.pack.this_entrypoint.before
execute if data storage slimecore:_ v.pack.ref_checks[0] run function slimecore:_/impl/eval/pack/ref_check/each

function slimecore:_/impl/eval/pack/entrypoints/set_key {key:"after"}
data modify storage slimecore:_ v.pack.ref_checks set from storage slimecore:_ v.pack.this_entrypoint.before
execute if data storage slimecore:_ v.pack.ref_checks[0] run function slimecore:_/impl/eval/pack/ref_check/each

data remove storage slimecore:_ v.pack.entrypoints[-1]
execute if data storage slimecore:_ v.pack.entrypoints[0] run function slimecore:_/impl/eval/pack/entrypoints/each
