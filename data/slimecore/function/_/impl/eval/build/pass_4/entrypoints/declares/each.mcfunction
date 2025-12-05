# IMPL > slimecore:eval/build
# pass_4/entrypoints/declares/each
#--------------------
# ../eval.1
#--------------------
# right-to-left iteration of declares

data modify storage slimecore:_ x.compare_id set from storage slimecore:_ v.build.eval[-1].declares[-1].id

# stop when self is reached
execute store success score *x _slimecore run data modify storage slimecore:_ x.compare_id set from storage slimecore:_ v.build.evalin[-1].id
execute if score *x _slimecore matches 0 run data modify storage slimecore:_ v.build.eval[-1].befores append from storage slimecore:_ v.build.eval[-1].declares[-1].before[]
execute if score *x _slimecore matches 0 run return 0

data modify storage slimecore:_ v.build.eval[-1].befores append value {}
data modify storage slimecore:_ v.build.eval[-1].befores[-1].id set from storage slimecore:_ v.build.eval[-1].declares[-1].id
data modify storage slimecore:_ v.build.eval[-1].befores[-1].pack_ref set from storage slimecore:_ v.build.evalin[-1].pack_ref

data remove storage slimecore:_ v.build.eval[-1].declares[-1]
execute if data storage slimecore:_ v.build.eval[-1].declares[0] run function slimecore:_/impl/eval/build/pass_4/entrypoints/declares/each