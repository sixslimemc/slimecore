#> slimecore : evaluate/build
#--------------------
# -> packs[]: PackManifest
#--------------------
# <~ value? Build
# <~ error? BuildEvaluationError
#--------------------
# TODO: description
#--------------------
# 1: valid build; >value< contains data.
# 0: invalid build; >error< contains data.
#--------------------

data remove storage slimecore:out build

execute store result score *x _slimecore run function slimecore:_/impl/evaluate/build/main

data remove storage slimecore:in build
data remove storage slimecore:_ impl.build

return run scoreboard players get *x _slimecore