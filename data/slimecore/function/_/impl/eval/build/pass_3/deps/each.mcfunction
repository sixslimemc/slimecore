# IMPL > slimecore:eval/build
# pass_3/deps/each

function slimecore:_/impl/eval/build/pass_3/eval with storage slimecore:_ v.build.evalstack[-1].iter[-1]

data remove storage slimecore:_ v.build.evalstack[-1].iter[-1]
execute if data storage slimecore:_ v.build.evalstack[-1].iter[0] run function slimecore:_/impl/eval/build/pass_3/deps/each