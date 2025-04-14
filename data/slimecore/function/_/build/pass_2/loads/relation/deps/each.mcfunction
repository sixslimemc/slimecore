#> slimecore:_/build/pass_2/deps/each
#--------------------
# ../eval
#--------------------

data modify storage slimecore:_ var.build.evalroot set from storage slimecore:_ var.build.relstack[-1].deps[-1]

function slimecore:_/build/pass_2/loads/relation/eval with storage slimecore:_ var.build

execute if score *build.error _slimecore matches 1.. run return fail
data remove storage slimecore:_ var.build.relstack[-1].deps[-1]
execute if data storage slimecore:_ var.build.relstack[-1].deps[0] run function slimecore:_/build/pass_2/loads/relation/deps/each