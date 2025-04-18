#> slimecore:_/build/pass_3/deps/each
#--------------------
# ../each
#--------------------

data modify storage slimecore:_ var.build.this_dep set from storage slimecore:_ var.build.deps[-1]

# installed:
execute store success score *x _slimecore run function slimecore:_/build/pass_3/deps/installed_check with storage slimecore:_ var.build.this_dep

# version:
execute if score *x _slimecore matches 1 run function slimecore:_/build/pass_3/deps/version_check

data remove storage slimecore:_ var.build.deps[-1]
execute if data storage slimecore:_ var.build.deps[0] run function slimecore:_/build/pass_3/deps/each
