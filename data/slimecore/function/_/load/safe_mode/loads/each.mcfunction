#> slimecore:_/load/safe_mode/loads/each
#--------------------
# ../do
#--------------------
# forward order.

function slimecore:_/load/safe_mode/loads/try_call with storage slimecore:_ t.safe_mode.loads[0]

data remove storage slimecore:_ t.safe_mode.loads[0]
execute if data storage slimecore:_ t.safe_mode.loads[0] run function slimecore:_/load/safe_mode/loads/each