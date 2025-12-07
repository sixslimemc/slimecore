# IMPL > slimecore:eval/build
# finalize/entrypoint_order/each
#--------------------
# ../do
#--------------------

data modify storage slimecore:_ x.entry set from storage slimecore:_ v.build.entrypoints[0]
execute store result storage slimecore:_ x.entry.index int 1 run scoreboard players get *build.index _slimecore

data modify storage slimecore:_ x.mline set value {1:"data modify storage slimecore:out build.result.success.order.'", 2:true, 3:"' append from storage slimecore:_ x.entry"}
data modify storage slimecore:_ x.mline.2 set from storage slimecore:_ v.build.map_key
function slimecore:_/util/mline/3 with storage slimecore:_ x.mline

scoreboard players add *build.index _slimecore 1
data remove storage slimecore:_ v.build.entrypoints[0]
execute if data storage slimecore:_ v.build.entrypoints[0] run function slimecore:_/impl/eval/build/finalize/entrypoint_order/each