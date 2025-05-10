#> slimecore : evaluate/component/pack_requirement
#--------------------
# -> input: InputPackRequirement | any
#--------------------
# <~ value? PackRequirement
# <~ error? CompoundValidationError
#--------------------
# TODO: description
#--------------------
# 1: <input> is a valid InputPackRequirement; >value< contains data.
# 0: invalid is not a valid InputPackRequirement; >error< contains data.
#--------------------

data remove storage slimecore:out pack_requirement

execute store result score *x _slimecore run function slimecore:_/impl/evaluate/component/pack_requirement/main

data remove storage slimecore:_ v.pack_requirement
data remove storage slimecore:in pack_requirement

return run scoreboard players get *x _slimecore