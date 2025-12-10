#> slimecore : eval/pack
#--------------------
# -> pack: (PackManifest | any)
#--------------------
# <- result: EvalResult<PackManifest, TODO>
#--------------------
# TODO: description
#--------------------
# 1: 
#--------------------

data modify storage slimecore:out pack set value {}

execute store result score *x _slimecore run function slimecore:_/impl/eval/pack/main

data remove storage slimecore:_ v.pack
data remove storage slimecore:in pack

return run scoreboard players get *x _slimecore