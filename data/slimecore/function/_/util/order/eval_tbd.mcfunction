#> slimecore:_/util/order/eval_tbd
#--------------------
# ./main
#--------------------

# push empty buffer:
data modify storage slimecore:_ var.order.recstack append value {}
data modify storage slimecore:_ var.order.recstack[-1].buffer set from storage slimecore:_ const.alphabet.empty_buffer

# set macro vars:
scoreboard players operation *x _slimecore = *order.index _slimecore
execute store result storage slimecore:_ var.order.each.istart int 1 run scoreboard players get *x _slimecore
execute store result storage slimecore:_ var.order.each.iend int 1 run scoreboard players add *x _slimecore 1

# iter through tbd, fill buffer:
execute if data storage slimecore:_ var.order.tbd[0] run function slimecore:_/util/order/words/each with storage slimecore:_ var.order.each

# iter through buffer, update out and tbd:
data modify storage slimecore:_ var.order.tbd set value []
execute if data storage slimecore:_ var.order.recstack[-1].buffer[0] run function slimecore:_/util/order/buffer/each

# pop buffer:
data remove storage slimecore:_ var.order.recstack[-1]