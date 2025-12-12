#> slimecore : eval/pack
#--------------------
# -> pack: (PackManifest | any)
#--------------------
# <- result: EvalResult<true, TODO>
#--------------------
# TODO: description
#--------------------
# 1: 
#--------------------

data remove storage slimecore:out pack

execute store result score *x _slimecore run function slimecore:_/impl/eval/pack/main

data remove storage slimecore:_ v.pack
data remove storage slimecore:in pack
scoreboard players reset *pack.error _slimecore
scoreboard players reset *pack.index _slimecore

return run scoreboard players get *x _slimecore