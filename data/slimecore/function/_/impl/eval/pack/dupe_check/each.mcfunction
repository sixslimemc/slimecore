# IMPL > slimecore:eval/pack
# dupe_check/each

data modify storage slimecore:_ v.pack.this_check set from storage slimecore:_ v.pack.dupe_checks[-1]

data modify storage slimecore:_ x.macro set value {}
data modify storage slimecore:_ x.macro.id_key set from storage slimecore:_ v.pack.id_key
data modify storage slimecore:_ x.macro.key set from storage slimecore:_ v.pack.key
data modify storage slimecore:_ x.mline set value {1:"data modify storage slimecore:_ x.macro.id set from storage slimecore:_ v.pack.this_check.'", 2:true, 3:"'"}
data modify storage slimecore:_ x.mline.2 set from storage slimecore:_ v.pack.id_key
function slimecore:_/util/mline/3 with storage slimecore:_ x.mline
function slimecore:_/impl/eval/pack/dupe_check/each.1 with storage slimecore:_ x.macro

# removed in each.1
# data remove storage slimecore:_ v.pack.dupe_checks[-1]
execute if data storage slimecore:_ v.pack.dupe_checks[0] run function slimecore:_/impl/eval/pack/ref_check/each