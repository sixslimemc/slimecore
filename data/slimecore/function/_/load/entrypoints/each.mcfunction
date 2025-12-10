#> slimecore:_/load/entrypoints/each
#--------------------
# ../main
#--------------------
# forward order

data modify storage slimecore:_ v.load.pack_ref set from storage slimecore:_ v.load.entrypoints[0].pack_ref
data modify storage slimecore:_ v.load.id set from storage slimecore:_ v.load.entrypoints[0].id
function slimecore:_/load/entrypoints/call with storage slimecore:_ v.load

data remove storage slimecore:_ v.load.entrypoints[0]
execute if data storage slimecore:_ v.load.entrypoints[0] run function slimecore:_/load/entrypoints/each