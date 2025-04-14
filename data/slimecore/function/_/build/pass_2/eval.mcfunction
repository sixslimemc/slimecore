#> slimecore:_/build/pass_2/eval
#--------------------
# ./each
#--------------------

data modify storage slimecore:_ var.build.this_dep set from storage slimecore:_ var.build.evalroot

# DEBUG:
tellraw @a ["EVAL: ", {'storage':'slimecore:_', 'nbt':'var.build.evalroot.pack'}]

# DEBUG:
tellraw @a ["STACK: ", {'storage':'slimecore:_', 'nbt':'var.build.depstack'}]

# dependency cycle builder
data modify storage slimecore:_ var.build.e.depcycle set value []
data modify storage slimecore:_ var.build.e.depcycle append from storage slimecore:_ var.build.this_dep

data modify storage slimecore:_ var.build.xstack set from storage slimecore:_ var.build.depstack

execute if data storage slimecore:_ var.build.depstack[0] run function slimecore:_/build/pass_2/depstack/each
data modify storage slimecore:_ var.build.depstack set from storage slimecore:_ var.build.xstack

data modify storage slimecore:_ var.build.depstack append value {}
data modify storage slimecore:_ var.build.depstack[-1].root set from storage slimecore:_ var.build.evalroot

# 'deps' includes deps and sups.
function slimecore:_/build/pass_2/get_deps with storage slimecore:_ var.build.evalroot

# DEBUG:
tellraw @a ["DEPS: ", {'storage':'slimecore:_', 'nbt':'var.build.depstack[-1].deps[].pack'}]

execute if data storage slimecore:_ var.build.depstack[-1].deps[0] run function slimecore:_/build/pass_2/deps/each

data remove storage slimecore:_ var.build.depstack[-1]

# relation: PackID => {needed_by[]: PackID, order:{load:{pack: PackID, polarity:-1|1}, pre_load...}}
