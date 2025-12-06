# IMPL > slimecore:eval/build
# pass_3/deps/each

function slimecore:_/impl/eval/build/pass_3/eval with storage slimecore:_ v.build.evalstack[-1].iter[-1]

data modify storage slimecore:_ x.parent_id set from storage slimecore:_ v.build.depstack[-1].pack_ref
data modify storage slimecore:_ x.dep_id set from storage slimecore:_ v.build.evalstack[-1].iter[-1].pack_id
function slimecore:_/impl/eval/build/pass_3/deps/add with storage slimecore:_ x

data remove storage slimecore:_ v.build.evalstack[-1].iter[-1]
execute if data storage slimecore:_ v.build.evalstack[-1].iter[0] run function slimecore:_/impl/eval/build/pass_3/deps/each