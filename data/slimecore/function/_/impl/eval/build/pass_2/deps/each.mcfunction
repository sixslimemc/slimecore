# IMPL > slimecore:eval/build
# pass_2/deps/each

data modify storage slimecore:_ v.build.this_dep set from storage slimecore:_ v.build.deps[-1]

data remove storage slimecore:_ v.build.dep_pack
data modify storage slimecore:_ x.mline set value {1:"data modify storage slimecore:_ v.build.dep_pack set from storage slimecore:_ v.build.maps.packs.'", 2:true, 3:"'"}
data modify storage slimecore:_ x.mline.2 set from storage slimecore:_ v.build.this_dep.pack_id
function slimecore:_/util/mline/3 with storage slimecore:_ x.mline

execute store result score *build.dep_error _slimecore run function slimecore:_/impl/eval/build/pass_2/deps/check
execute unless score *build.dep_error _slimecore matches 0 run function slimecore:_/impl/eval/build/pass_2/deps/unfulfilled

data remove storage slimecore:_ v.build.deps[-1]
execute if data storage slimecore:_ v.build.deps[0] run function slimecore:_/impl/eval/build/pass_2/deps/each