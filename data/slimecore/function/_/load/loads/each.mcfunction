#> slimecore:_/load/loads/each
#--------------------
# ../main
#--------------------
# forward order

function slimecore:_/load/loads/call with storage slimecore:_ v.load.loads[0]

data remove storage slimecore:_ v.load.loads[0]
execute if data storage slimecore:_ v.load.loads[0] run function slimecore:_/load/loads/each