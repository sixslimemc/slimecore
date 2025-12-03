# IMPL > slimecore:eval/build
# pass_1/each

data modify storage slimecore:_ v.build.this_pack set from storage slimecore:_ v.build.packs[-1]

# {..map.packs}
data modify storage slimecore:_ x set value {1:"data modify storage slimecore:_ v.build.maps.packs.'", 2:true, 3:"' set from storage slimecore:_ v.build.this_pack"}
data modify storage slimecore:_ x.2 set from storage slimecore:_ v.build.this_pack.pack_id
function slimecore:_/util/mline/3 with storage slimecore:_ x

data remove storage slimecore:_ v.build.packs[-1]
execute if data storage slimecore:_ v.build.packs[0] run function slimecore:_/impl/eval/build/pass_1/each
