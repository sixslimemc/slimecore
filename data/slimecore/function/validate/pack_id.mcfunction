#> slimecore : validate/pack_id
#--------------------
# -> value: any
#--------------------
# <~ error: ValueValidationError
#--------------------
# TODO: description
#--------------------
# 1: <value> is a $PackID
# 0: <value> is not a $PackID
#--------------------

data remove storage slimecore:out pack_id

execute store success score *x _slimecore run function slimecore:_/impl/validate/pack_id/main with storage slimecore:in pack_id

execute if score *x _slimecore matches 0 run data merge storage slimecore:out {pack_id:{error:{invalid_value:{expected:"valid datapack namespace"}}}}
execute if score *x _slimecore matches 0 run data modify storage slimecore:out pack_id.error.invalid_value.got set from storage slimecore:in pack_id.value

data remove storage slimecore:in pack_id

return run scoreboard players get *x _slimecore