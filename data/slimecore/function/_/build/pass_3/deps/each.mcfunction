#> slimecore:_/build/pass_3/deps/each
#--------------------
# ../each
#--------------------

data modify storage slimecore:_ var.build.this_dep set from storage slimecore:_ var.build.deps[-1]

function slimecore:_/build/pass_3/deps/installed_check with storage slimecore:_ var.build.this_dep

data remove storage slimecore:_ var.build.deps[-1]
execute if data storage slimecore:_ var.build.deps[0] run function slimecore:_/build/pass_3/deps/each
