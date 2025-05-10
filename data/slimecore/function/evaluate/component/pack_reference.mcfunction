#> slimecore : evaluate/component/pack_reference
#--------------------
# -> input: InputPackReference
#--------------------
# <~ value: PackReference
# <~ error: ValueValidationError
#--------------------
# TODO: description
#--------------------
# 1: valid <input>; >value< contains data.
# 0: invalid <input>; >error< contains data.
#--------------------

data remove storage slimecore:out pack_reference

execute store result score *x _slimecore run function slimecore:_/impl/evaluate/component/pack_reference/main

data remove storage slimecore:_ v.pack_reference
data remove storage slimecore:in pack_reference

return run scoreboard players get *x _slimecore