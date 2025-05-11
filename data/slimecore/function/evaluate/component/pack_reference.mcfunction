#> slimecore : evaluate/component/pack_reference
#--------------------
# -> input: InputPackReference | any
#--------------------
# <~ value: PackReference
# <~ error: ValueValidationError
#--------------------
# TODO: description
#--------------------
# 1: <input> is a valid InputPackReference; >value< contains data.
# 0: <input> is not a valid InputPackReference; >error< contains data.
#--------------------

data remove storage slimecore:out pack_reference

execute store result score *x _slimecore run function slimecore:_/impl/evaluate/component/pack_reference/main

execute if score *x _slimecore matches 0 run data merge storage slimecore:out {pack_reference:{error:{invalid_value:{expected:'valid $namespace (excluding "minecraft" and "slimecore") or PackReference'}}}}
execute if score *x _slimecore matches 0 run data modify storage slimecore:out pack_reference.error.invalid_value.got set from storage slimecore:in pack_reference.input

data remove storage slimecore:_ v.pack_reference
data remove storage slimecore:in pack_reference

return run scoreboard players get *x _slimecore