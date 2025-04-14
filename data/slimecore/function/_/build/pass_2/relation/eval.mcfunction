#> slimecore:_/build/pass_2/relation/eval
#--------------------
# ./each
#--------------------

data modify storage slimecore:_ var.build.this_dep set from storage slimecore:_ var.build.evalroot

data modify storage slimecore:_ var.build.xstack set from storage slimecore:_ var.build.relstack

data modify storage slimecore:_ var.build.load_words set from storage slimecore:_ const.load_words
execute if data storage slimecore:_ var.build.load_words[0] run function slimecore:_/build/pass_2/relation/loads/each


execute if data storage slimecore:_ var.build.depstack[0] run function slimecore:_/build/pass_2/cycle/depstack/each
data modify storage slimecore:_ var.build.depstack set from storage slimecore:_ var.build.xstack

data modify storage slimecore:_ var.build.depstack append value {}
data modify storage slimecore:_ var.build.depstack[-1].root set from storage slimecore:_ var.build.evalroot

# 'deps' includes deps and sups.
function slimecore:_/build/pass_2/cycle/get_deps with storage slimecore:_ var.build.evalroot

execute if data storage slimecore:_ var.build.depstack[-1].deps[0] run function slimecore:_/build/pass_2/cycle/deps/each

data remove storage slimecore:_ var.build.depstack[-1]
