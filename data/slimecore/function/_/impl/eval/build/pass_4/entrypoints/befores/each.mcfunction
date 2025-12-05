# IMPL > slimecore:eval/build
# pass_4/entrypoints/befores/each

data modify storage slimecore:_ v.build.this_before set from storage slimecore:_ v.build.befores[-1]



data remove storage slimecore:_ v.build.befores[-1]
execute if data storage slimecore:_ v.build.befores[0] run function slimecore:_/impl/eval/build/pass_4/entrypoints/befores/each