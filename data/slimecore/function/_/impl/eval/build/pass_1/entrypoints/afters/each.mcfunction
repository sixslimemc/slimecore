# IMPL > slimecore:eval/build
# pass_1/entrypoints/afters/each
#--------------------
# ../each
#--------------------

data modify storage slimecore:_ v.build.this_after set from storage slimecore:_ v.build.afters[-1]

data modify storage slimecore:_ x.mline set value {1:"data modify storage slimecore:_ v.build.maps.'", 2:true, 3:"'.'", 4:true, 5:"'.'", 6:true, 7:"' append from storage slimecore:_ x.mline.entry"}
data modify storage slimecore:_ x.mline.2 set from storage slimecore:_ v.build.map_key
data modify storage slimecore:_ x.mline.4 set from storage slimecore:_ v.build.this_after.pack_ref
data modify storage slimecore:_ x.mline.6 set from storage slimecore:_ v.build.this_after.id
data modify storage slimecore:_ x.mline.entry.pack_ref set from storage slimecore:_ v.build.this_pack.pack_id
data modify storage slimecore:_ x.mline.entry.id set from storage slimecore:_ v.build.this_entrypoint.id
function slimecore:_/util/mline/7 with storage slimecore:_ x.mline

data remove storage slimecore:_ v.build.afters[-1]
execute if data storage slimecore:_ v.build.afters[0] run function slimecore:_/impl/eval/build/pass_1/entrypoints/afters/each