# IMPL > slimecore:eval/build
# pass_2/ref_check/checks/each
#--------------------
# ../entrypoints/each
#--------------------

data modify storage slimecore:_ v.build.this_check set from storage slimecore:_ v.build.checks[-1]
data remove storage slimecore:_ v.build.checks[-1]
execute store result storage slimecore:_ v.build.key_parts[-1].index int 1 if data storage slimecore:_ v.build.checks[]

# check:
data modify storage slimecore:_ x.macro set from storage slimecore:_ v.build.this_check
data modify storage slimecore:_ x.macro.check_key set from storage slimecore:_ v.build.check_key
execute store result score *x _slimecore run function slimecore:_/impl/eval/build/pass_2/ref_check/checks/check with storage slimecore:_ x.macro

# if invalid:
execute if score *x _slimecore matches 0 run function slimecore:_/impl/eval/build/pass_2/ref_check/checks/invalid

execute if data storage slimecore:_ v.build.checks[0] run function slimecore:_/impl/eval/build/pass_2/ref_check/checks/each