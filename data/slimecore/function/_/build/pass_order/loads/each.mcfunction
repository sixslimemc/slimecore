#> slimecore:_/build/pass_order/loads/each
#--------------------
# ../each
#--------------------

data modify storage slimecore:_ var.build.this_load set from storage slimecore:_ var.build.load_words[-1]



data remove storage slimecore:_ var.build.load_words[-1]
execute if data storage slimecore:_ var.build.load_words[0] run function slimecore:_/build/pass_order/loads/each