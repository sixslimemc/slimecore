#> slimecore:_/util/order/tbd_loop
#--------------------
# ./main
#--------------------

# empty buffer:
data modify storage slimecore:_ var.order.buffer set from storage slimecore:_ const.alphabet.empty_buffer

# set macro vars:
execute store result storage slimecore:_ var.order.each.istart int 1 run scoreboard players get *order.index _slimecore
execute store result storage slimecore:_ var.order.each.iend int 1 run scoreboard players add *order.index _slimecore 1

# iter through tbd, fill buffer:
execute if data storage slimecore:_ var.order.tbd[0] run function slimecore:_/util/order/words/each with storage slimecore:_ var.order.each

# iter through buffer, update out and tbd:
data modify storage slimecore:_ var.order.tbd set value []
execute if data storage slimecore:_ var.order.buffer[0] run function slimecore:_/util/order/buffer/each

# loop if any tbd found:
execute if data storage slimecore:_ var.order.tbd[0] run function slimecore:_/util/order/tbd_loop