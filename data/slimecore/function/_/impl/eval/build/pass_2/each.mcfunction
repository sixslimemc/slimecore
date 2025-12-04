# IMPL > slimecore:eval/build
# pass_2/each


data modify storage slimecore:_ v.build.depstack set value []

data modify storage slimecore:_ x.pack_ref set from storage slimecore:_ v.build.packs[-1].pack_id
function slimecore:_/impl/eval/build/pass_2/eval with storage slimecore:_ x

data remove storage slimecore:_ v.build.packs[-1]
execute if data storage slimecore:_ v.build.packs[0] run function slimecore:_/impl/eval/build/pass_2/each
