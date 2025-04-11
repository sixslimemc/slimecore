#> slimecore:_/util/order/buffer/each
#--------------------
# ../tbd_loop
#--------------------

data modify storage slimecore:_ var.order.this_buf set from storage slimecore:_ var.order.buffer[-1]

# check if this buf has 1 or more words:
execute store result score *x _slimecore if data storage slimecore:_ var.order.this_buf[0]
execute store result score *y _slimecore if data storage slimecore:_ var.order.this_buf[1]

# if exactly 1 word, add to result, if more, add to tbd:
execute if score *x _slimecore matches 1 unless score *y _slimecore matches 1 run data modify storage slimecore:_ util.order.out.result append from storage slimecore:_ var.order.this_buf[0]
execute if score *y _slimecore matches 1 run data modify storage slimecore:_ var.order.tbd append from storage slimecore:_ var.order.this_buf[]

data remove storage slimecore:_ var.order.buffer[-1]
execute if data storage slimecore:_ var.order.buffer[0] run function slimecore:_/util/order/buffer/each