#> slimecore : validate/component/int
#--------------------
# -> value: int | any
#--------------------
# <~ error? ValueValidationError
#--------------------
# TODO: description
#--------------------
# 1: <value> is a valid int.
# 0: <value> is not a valid int; >error< contains data.
#--------------------

data remove storage slimecore:out int

execute store success score *x _slimecore run function slimecore:_/impl/validate/component/int/main with storage slimecore:in int

execute if score *x _slimecore matches 0 run data merge storage slimecore:out {int:{error:{invalid_value:{expected:'integer'}}}}
execute if score *x _slimecore matches 0 run data modify storage slimecore:out int.error.invalid_value.got set from storage slimecore:in int.value

data remove storage slimecore:_ v.int
data remove storage slimecore:in int

return run scoreboard players get *x _slimecore