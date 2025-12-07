# IMPL > slimecore:eval/build
# pass_2/each

data modify storage slimecore:_ v.build.this_pack set from storage slimecore:_ v.build.packs[-1]

# dependencies:
data modify storage slimecore:_ v.build.deps set from storage slimecore:_ v.build.this_pack.dependencies
execute if data storage slimecore:_ v.build.deps[0] run function slimecore:_/impl/eval/build/pass_2/deps/each

# declarations:
data modify storage slimecore:_ v.build.abstracts set from storage slimecore:_ v.build.this_pack.abstract_declarations
execute if data storage slimecore:_ v.build.abstracts[0] run function slimecore:_/impl/eval/build/pass_2/abstracts/each

data remove storage slimecore:_ v.build.packs[-1]
execute if data storage slimecore:_ v.build.packs[0] run function slimecore:_/impl/eval/build/pass_2/each
