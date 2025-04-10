#> slimecore:_/build/second_pass/deps/each
#--------------------
# ../eval
#--------------------

data modify storage slimecore:_ var.build.evalroot set from storage slimecore:_ var.build.depstack[-1].deps[-1]
function slimecore:_/build/second_pass/eval

data remove storage slimecore:_ var.build.depstack[-1].deps[-1]
execute if data storage slimecore:_ var.build.depstack[-1].deps[0] run function slimecore:_/build/second_pass/deps/each