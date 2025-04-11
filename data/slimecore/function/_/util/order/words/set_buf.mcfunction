#> slimecore:_/util/order/words/set_buf
#--------------------
# ./each
#--------------------

# uses reversed_val because buffer will be iterated through backwards.
$data modify storage slimecore:_ var.order.buffer[$(reversed_val)] append from storage slimecore:_ var.order.this_word