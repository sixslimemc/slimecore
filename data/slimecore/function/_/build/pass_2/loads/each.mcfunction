#> slimecore:_/build/pass_2/relation/loads/each
#--------------------
# ../eval
#--------------------

data modify storage slimecore:_ var.build.this_load set from storage slimecore:_ var.build.load_words[-1]

data modify storage slimecore:_ var.build.relstack set value []
data modify storage slimecore:_ var.build.evalroot set from storage slimecore:_ var.build.this_man
function slimecore:_/build/pass_2/loads/relation/eval with storage slimecore:_ var.build

data remove storage slimecore:_ var.build.load_words[-1]
execute if data storage slimecore:_ var.build.load_words[0] run function slimecore:_/build/pass_2/loads/each