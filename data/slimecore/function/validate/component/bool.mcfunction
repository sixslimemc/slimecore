#> slimecore : validate/component/bool
#--------------------
# -> value: bool | any
#--------------------
# <~ error? ValueValidationError
#--------------------
# TODO: description
#--------------------
# 1: <value> is a valid bool.
# 0: <value> is not a valid bool; >error< contains data.
#--------------------

data remove storage slimecore:out bool

scoreboard players set *x _slimecore 1
execute unless data storage slimecore:in bool{value:true} unless data storage slimecore:in bool{value:false} run scoreboard players set *x _slimecore 0

execute if score *x _slimecore matches 0 run data merge storage slimecore:out {bool:{error:{invalid_value:{expected:'bool'}}}}
execute if score *x _slimecore matches 0 run data modify storage slimecore:out bool.error.invalid_value.got set from storage slimecore:in bool.value

data remove storage slimecore:in bool

return run scoreboard players get *x _slimecore