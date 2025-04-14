#> slimecore:_/build/pass_order/each
#--------------------
# ../main
#--------------------

data modify storage slimecore:_ var.build.this_pack set from storage slimecore:_ var.build.order_iter[-1]

data modify storage slimecore:_ var.build.load_words set from storage slimecore:_ const.load_words
execute if data storage slimecore:_ var.build.load_words[0] run function slimecore:_/build/pass_order/loads/each

scoreboard players add *build.order_ptr _slimecore 1
data remove storage slimecore:_ var.build.order_iter[-1]
execute if data storage slimecore:_ var.build.order_iter[0] run return run function slimecore:_/build/pass_order/each
