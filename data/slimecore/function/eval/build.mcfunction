#> slimecore : eval/build
#--------------------
# -> packs: [PackManifest]
#--------------------
# <- result: EvalResult<Build, TODO>
#--------------------
# TODO: description
#--------------------
# 1: success
# 0: error
#--------------------

data remove storage slimecore:out build

execute store result score *x _slimecore run function slimecore:_/impl/eval/build/main

data remove storage slimecore:_ v.build
data remove storage slimecore:in build

return run scoreboard players get *x _slimecore