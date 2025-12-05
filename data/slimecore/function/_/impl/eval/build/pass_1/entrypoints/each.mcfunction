# IMPL > slimecore:eval/build
# pass_1/entrypoints/each
#--------------------
# ../each
#--------------------

data modify storage slimecore:_ v.build.this_entrypoint set from storage slimecore:_ v.build.entrypoints[-1]

data modify storage slimecore:_ v.build.afters set from storage slimecore:_ v.build.this_entrypoint.after
execute if data storage slimecore:_ v.build.afters[0] run function slimecore:_/impl/eval/build/pass_1/entrypoints/afters/each

data remove storage slimecore:_ v.build.entrypoints[-1]
execute if data storage slimecore:_ v.build.entrypoints[0] run function slimecore:_/impl/eval/build/pass_1/entrypoints/each