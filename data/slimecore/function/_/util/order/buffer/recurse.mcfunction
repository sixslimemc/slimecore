#> slimecore:_/util/order/buffer/recurse
#--------------------
# ./each
#--------------------

scoreboard players add *order.index _slimecore 1
data modify storage slimecore:_ var.order.tbd set from storage slimecore:_ var.order.this_buf
execute if data storage slimecore:_ var.order.tbd[0] run function slimecore:_/util/order/eval_tbd
scoreboard players remove *order.index _slimecore 1