# IMPL > slimecore:eval/pack
# ref_check/each

data modify storage slimecore:_ x.mline set value {1:"execute unless data storage slimecore:in pack.pack.dependencies[{pack_id:'", 2:true, 3:"'}] run function slimecore:_/impl/eval/pack/ref_check/invalid"}
data modify storage slimecore:_ x.mline.2 set from storage slimecore:_ v.pack.ref_checks[-1].pack_ref
function slimecore:_/util/mline/3 with storage slimecore:_ x.mline

data remove storage slimecore:_ v.pack.ref_checks[-1]
execute if data storage slimecore:_ v.pack.ref_checks[0] run function slimecore:_/impl/eval/pack/ref_check/each