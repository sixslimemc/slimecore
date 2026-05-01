# IMPL > slimecore:eval/build
# pass_1/invalid_pack
#--------------------
# ./each
#--------------------

scoreboard players set *build.error _slimecore 1

data modify storage slimecore:_ x.entry set value {invalid_pack:{}, error:{}}
data modify storage slimecore:_ x.entry.invalid_pack set from storage slimecore:_ v.build.this_pack
data modify storage slimecore:_ x.entry.error set from storage slimecore:_ v.build.pack_eval.error
data modify storage slimecore:out build.result.error.invalid_packs append from storage slimecore:_ x.entry