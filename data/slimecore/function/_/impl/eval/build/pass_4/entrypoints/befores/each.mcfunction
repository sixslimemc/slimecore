# IMPL > slimecore:eval/build
# pass_4/entrypoints/befores/each
#--------------------
# ../eval.1
#--------------------

data modify storage slimecore:_ v.build.eval[-1].this_before set from storage slimecore:_ v.build.eval[-1].befores[-1]

data modify storage slimecore:_ v.build.evalin append from storage slimecore:_ v.build.eval[-1].this_before
function slimecore:_/impl/eval/build/pass_4/entrypoints/eval
data modify storage slimecore:_ v.build.eval[-1].merging set from storage slimecore:_ v.build.evalout
data modify storage slimecore:_ x.map_key set from storage slimecore:_ v.build.map_key
data modify storage slimecore:_ x.source_pack_id set from storage slimecore:_ v.build.evalin[-1].pack_ref
data modify storage slimecore:_ x.source_id set from storage slimecore:_ v.build.evalin[-1].id
data modify storage slimecore:_ x.target_pack_id set from storage slimecore:_ v.build.eval[-1].this_before.pack_ref
data modify storage slimecore:_ x.target_id set from storage slimecore:_ v.build.eval[-1].this_before.id
function slimecore:_/impl/eval/build/pass_4/entrypoints/befores/each.1 with storage slimecore:_ x

data remove storage slimecore:_ v.build.eval[-1].befores[-1]
execute if data storage slimecore:_ v.build.eval[-1].befores[0] run function slimecore:_/impl/eval/build/pass_4/entrypoints/befores/each