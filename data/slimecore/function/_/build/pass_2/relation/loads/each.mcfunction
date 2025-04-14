#> slimecore:_/build/pass_2/relation/loads/each
#--------------------
# ../eval
#--------------------

data modify storage slimecore:_ var.build.this_load set from storage slimecore:_ var.build.load_words[-1]
data modify storage slimecore:_ var.build.relstack set from storage slimecore:_ var.build.xstack



data remove storage slimecore:_ var.build.load_words[-1]
execute if data storage slimecore:_ var.build.load_words[0] run function slimecore:_/build/pass_2/relation/loads/each