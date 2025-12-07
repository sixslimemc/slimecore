# IMPL > slimecore:eval/build
# pass_4/entrypoints/eval
#--------------------
# ./each
#--------------------

# IN {..evalin[-1]}:
# -> id
# -> pack_ref

# OUT {..evalout} => {..maps.<pack_ref>.<id>} entry
say hi
data remove storage slimecore:_ v.build.evalout
data modify storage slimecore:_ v.build.eval append value {}

# sets {..evalout}
data modify storage slimecore:_ x set from storage slimecore:_ v.build.evalin[-1]
data modify storage slimecore:_ x.map_key set from storage slimecore:_ v.build.map_key
data modify storage slimecore:_ x.pack_key set from storage slimecore:_ v.build.pack_key
function slimecore:_/impl/eval/build/pass_4/entrypoints/eval.1 with storage slimecore:_ x

data remove storage slimecore:_ v.build.eval[-1]
data remove storage slimecore:_ v.build.evalin[-1]