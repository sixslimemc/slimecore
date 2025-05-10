#> slimecore : validate/component/pack_id
#--------------------
# -> value: $PackID | any
#--------------------
# <~ error? ValueValidationError
#--------------------
# TODO: description
#--------------------
# 1: <value> is a valid $PackID
# 0: <value> is not a valid $PackID; >error< contains data.
#--------------------

data remove storage slimecore:out pack_id

scoreboard players set *x _slimecore 0
execute store result score *x _slimecore run function slimecore:_/impl/validate/component/pack_id/main with storage slimecore:in pack_id

execute if score *x _slimecore matches 0 run data merge storage slimecore:out {pack_id:{error:{invalid_value:{expected:"valid datapack namespace"}}}}
execute if score *x _slimecore matches -1 run data merge storage slimecore:out {pack_id:{error:{invalid_value:{expected:'valid datapack namespace (cannot be "minecraft")'}}}}
execute if score *x _slimecore matches -2 run data merge storage slimecore:out {pack_id:{error:{invalid_value:{expected:'valid datapack namespace (cannot be "slimecore")'}}}}

execute if score *x _slimecore matches ..0 run data modify storage slimecore:out pack_id.error.invalid_value.got set from storage slimecore:in pack_id.value

data remove storage slimecore:in pack_id

execute if score *x _slimecore matches ..-1 run scoreboard players set *x _slimecore 0
return run scoreboard players get *x _slimecore