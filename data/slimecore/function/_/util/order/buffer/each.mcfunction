#> slimecore:_/util/order/buffer/each
#--------------------
# ../tbd_loop
#--------------------

data modify storage slimecore:_ var.order.this_buf set from storage slimecore:_ var.order.recstack[-1].buffer[-1]

# check if this buf has 1 or more words:
execute store success score *x _slimecore if data storage slimecore:_ var.order.this_buf[0]
execute store success score *y _slimecore if data storage slimecore:_ var.order.this_buf[1]

# if exactly 1 word, add to result:
execute if score *x _slimecore matches 1 unless score *y _slimecore matches 1 run data modify storage slimecore:_ util.order.out.result append from storage slimecore:_ var.order.this_buf[0]

# if >1 word, recurse:
execute if score *y _slimecore matches 1 run function slimecore:_/util/order/buffer/recurse

data remove storage slimecore:_ var.order.recstack[-1].buffer[-1]
execute if data storage slimecore:_ var.order.recstack[-1].buffer[0] run function slimecore:_/util/order/buffer/each