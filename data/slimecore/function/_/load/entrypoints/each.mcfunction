#> slimecore:_/load/entrypoints/each
#--------------------
# ../main
#--------------------
# forward order

data modify storage slimecore:_ t.load.pack_ref set from storage slimecore:_ t.load.entrypoints[0].pack_ref
data modify storage slimecore:_ t.load.id set from storage slimecore:_ t.load.entrypoints[0].id
function slimecore:_/load/entrypoints/call with storage slimecore:_ t.load

data remove storage slimecore:_ t.load.entrypoints[0]
execute if data storage slimecore:_ t.load.entrypoints[0] run function slimecore:_/load/entrypoints/each