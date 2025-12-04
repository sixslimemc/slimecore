# IMPL > slimecore:eval/build
# pass_1/each

data modify storage slimecore:_ v.build.this_pack set from storage slimecore:_ v.build.packs[-1]

# {..map.packs}
# and duplicate detection
function slimecore:_/impl/eval/build/pass_1/try_add with storage slimecore:_ v.build.this_pack

# {..map.impls}
data modify storage slimecore:_ v.build.impls set from storage slimecore:_ v.build.this_pack.abstract_implementations
execute if data storage slimecore:_ v.build.impls[0] run function slimecore:_/impl/eval/build/pass_1/impls/each

data remove storage slimecore:_ v.build.packs[-1]
execute if data storage slimecore:_ v.build.packs[0] run function slimecore:_/impl/eval/build/pass_1/each
