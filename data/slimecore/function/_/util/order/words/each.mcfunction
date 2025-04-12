#> slimecore:_/util/order/words/each
#--------------------
# ../tbd_loop
#--------------------
# WITH {var.order.each}
# -> istart: int
# -> iend: int

data modify storage slimecore:_ var.order.this_word set from storage slimecore:_ var.order.tbd[-1]

data remove storage slimecore:_ var.order.letter
$execute store success score *order.has_next _slimecore run data modify storage slimecore:_ var.order.letter set string storage slimecore:_ var.order.this_word $(istart) $(iend)

# if string length has been reached, immediately add it to out:
execute unless score *order.has_next _slimecore matches 1 run data modify storage slimecore:_ util.order.out.result append from storage slimecore:_ var.order.this_word

# populate buffer:
# buffer iterated through backwards, so buffer is populated in reversed alphabetical order.
execute if score *order.has_next _slimecore matches 1 run function slimecore:_/util/order/words/get_val with storage slimecore:_ var.order
execute if score *order.has_next _slimecore matches 1 run function slimecore:_/util/order/words/set_buf with storage slimecore:_ var.order

data remove storage slimecore:_ var.order.tbd[-1]
execute if data storage slimecore:_ var.order.tbd[0] run function slimecore:_/util/order/words/each with storage slimecore:_ var.order.each