#> slimecore : eval/pack
#--------------------
# -> pack: PackManifest
#--------------------
# <- result: EvalResult<PackManifest, TODO>
#--------------------
# TODO: description
#--------------------
# 1: 
#--------------------

data remove storage slimecore:out pack

execute store result score *x _slimecore run function slimecore:_/impl/eval/pack/main

data remove storage slimecore:_ v.pack
data remove storage slimecore:in pack

return run scoreboard players get *x _slimecore