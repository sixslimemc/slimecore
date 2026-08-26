# IMPL > slimecore:eval/build
# pass_2/ref_check/entrypoints/each
#--------------------
# ../do
#--------------------

data modify storage slimecore:_ v.build.this_entrypoint set from storage slimecore:_ v.build.entrypoints[-1]
data remove storage slimecore:_ v.build.entrypoints[-1]
execute store result storage slimecore:_ v.build.key_parts[-1].index int 1 if data storage slimecore:_ v.build.entrypoints[]

# check befores:
data modify storage slimecore:_ v.build.key_parts append value {key:"before", index:0}
data modify storage slimecore:_ v.build.checks set from storage slimecore:_ v.build.this_entrypoint.before
execute if data storage slimecore:_ v.build.checks[0] run function slimecore:_/impl/eval/build/pass_2/ref_check/checks/each
data remove storage slimecore:_ v.build.key_parts[-1]

# check afters:
data modify storage slimecore:_ v.build.key_parts append value {key:"after", index:0}
data modify storage slimecore:_ v.build.checks set from storage slimecore:_ v.build.this_entrypoint.after
execute if data storage slimecore:_ v.build.checks[0] run function slimecore:_/impl/eval/build/pass_2/ref_check/checks/each
data remove storage slimecore:_ v.build.key_parts[-1]

execute if data storage slimecore:_ v.build.entrypoints[0] run function slimecore:_/impl/eval/build/pass_2/ref_check/entrypoints/each