# IMPL > slimecore:eval/build
# pass_2/contracts/each

data modify storage slimecore:_ v.build.this_contract set from storage slimecore:_ v.build.contracts[-1]

data remove storage slimecore:_ v.build.impl_pack
data modify storage slimecore:_ x.mline set value {1:"data modify storage slimecore:_ v.build.impl_pack set from storage slimecore:_ v.build.maps.impls.'", 2:true, 3:"'.'", 4:true, 5:"'"}
data modify storage slimecore:_ x.mline.2 set from storage slimecore:_ v.build.this_pack.pack_id
data modify storage slimecore:_ x.mline.4 set from storage slimecore:_ v.build.this_contract.id
function slimecore:_/util/mline/5 with storage slimecore:_ x.mline

execute unless data storage slimecore:_ v.build.impl_pack run function slimecore:_/impl/eval/build/pass_2/contracts/unimplemented

# add to {..lists.contracts}
data modify storage slimecore:_ x.entry set value {contract:{pack_ref:"", id:""}, satisfier:{}}
data modify storage slimecore:_ x.entry.contract.pack_ref set from storage slimecore:_ v.build.this_pack.pack_id
data modify storage slimecore:_ x.entry.contract.id set from storage slimecore:_ v.build.this_contract.id
data modify storage slimecore:_ x.entry.satisfier set from storage slimecore:_ v.build.impl_pack
data modify storage slimecore:_ v.build.lists.contracts append from storage slimecore:_ x.entry

data remove storage slimecore:_ v.build.contracts[-1]
execute if data storage slimecore:_ v.build.contracts[0] run function slimecore:_/impl/eval/build/pass_2/contracts/each