#> slimecore : eval/safe_disables
#--------------------
# -> build: BuildInfo
# -> disables: [PackReference]
#--------------------
# <- safe: [PackReference]
# <- unsafe: [UnsafeDisableInfo]
# <- not_present: [PackReference]
#--------------------
# TODO: description
#--------------------
# 1: 
#--------------------

# TODO

data remove storage slimecore:out safe_disables

# execute store result score *x _slimecore run function slimecore:_/impl/eval/safe_disables/main

data remove storage slimecore:_ v.safe_disables
data remove storage slimecore:in safe_disables

return run scoreboard players get *x _slimecore