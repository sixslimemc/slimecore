# IMPL > slimecore:eval/build
# pass_2/each

data modify storage slimecore:_ v.build.this_pack set from storage slimecore:_ v.build.packs[-1]



data remove storage slimecore:_ v.build.packs[-1]
execute if data storage slimecore:_ v.build.packs[0] run function slimecore:_/impl/eval/build/pass_2/each
