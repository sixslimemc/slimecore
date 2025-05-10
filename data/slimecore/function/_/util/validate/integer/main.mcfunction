#> slimecore:util / validate/integer
#--------------------
# -> value: any
#--------------------
# .
#--------------------
# checks if <value> is an integer.
#--------------------
# 1: <value> is integer.
# 0: <value> not integer.
#--------------------

execute store success score *x _slimecore run function slimecore:_/util/validate/integer/macro with storage slimecore:_ util.integer.in

data remove storage slimecore:_ util.integer.in

return run scoreboard players get *x _slimecore