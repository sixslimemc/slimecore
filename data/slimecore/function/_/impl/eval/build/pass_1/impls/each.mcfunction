# IMPL > slimecore:eval/build
# pass_1/impls/each

data modify storage slimecore:_ v.build.this_impl set from storage slimecore:_ v.build.impls[-1]

function slimecore:_/impl/eval/build/pass_1/impls/try_add with storage slimecore:_ v.build.this_impl

data remove storage slimecore:_ v.build.impls[-1]
execute if data storage slimecore:_ v.build.impls[0] run function slimecore:_/impl/eval/build/pass_1/impls/each