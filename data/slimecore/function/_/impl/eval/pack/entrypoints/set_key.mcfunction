# IMPL > slimecore:eval/pack
# entrypoints/set_key
#--------------------
# ./each
#--------------------

$data modify storage slimecore:_ x.mline set value {1:"data modify storage slimecore:_ v.pack.key set value '", 2:true, 3:"[", 4:true, 5:"].$(key)"}
data modify storage slimecore:_ x.mline.2 set from storage slimecore:_ v.pack.entrypoint_key
execute store result storage slimecore:_ x.mline.4 int 1 run scoreboard players get *pack.index _slimecore
function slimecore:_/util/mline/5 with storage slimecore:_ x.mline