#> slimecore:_/build/order_cache/each
#--------------------
# ../main
#--------------------

data modify storage slimecore:_ var.build.this_pack set from storage slimecore:_ var.build.order_iter[-1]
scoreboard players remove *i _slimecore 1

function slimecore:_/build/order_cache/update_map with storage slimecore:_ var.build

data remove storage slimecore:_ var.build.order_iter[-1]
execute if data storage slimecore:_ var.build.order_iter[0] run function slimecore:_/build/order_cache/each
