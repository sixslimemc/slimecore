#> slimecore:_/build/pass_2/eval
#--------------------
# ./each
#--------------------

data modify storage slimecore:_ var.build.this_dep set from storage slimecore:_ var.build.evalroot

# dependency cycle builder
data modify storage slimecore:_ var.build.e.depcycle set value []
data modify storage slimecore:_ var.build.e.depcycle append from storage slimecore:_ var.build.this_dep

data modify storage slimecore:_ var.build.xstack set from storage slimecore:_ var.build.depstack

execute if data storage slimecore:_ var.build.depstack[0] run function slimecore:_/build/pass_2/cycle/depstack/each
data modify storage slimecore:_ var.build.depstack set from storage slimecore:_ var.build.xstack

data modify storage slimecore:_ var.build.depstack append value {}
data modify storage slimecore:_ var.build.depstack[-1].root set from storage slimecore:_ var.build.evalroot

# 'deps' includes deps and sups.
function slimecore:_/build/pass_2/cycle/get_deps with storage slimecore:_ var.build.evalroot

execute if data storage slimecore:_ var.build.depstack[-1].deps[0] run function slimecore:_/build/pass_2/cycle/deps/each

data remove storage slimecore:_ var.build.depstack[-1]

# relation: PackID => {needed_by[]: PackID, order:{load:{pack: PackID, polarity:-1|1}, pre_load...}}
