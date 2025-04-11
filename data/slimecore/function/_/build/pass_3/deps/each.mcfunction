#> slimecore:_/build/pass_3/deps/each
#--------------------
# ../each
#--------------------

data modify storage slimecore:_ var.build.this_man set from storage slimecore:_ var.build.manifests[-1]


data remove storage slimecore:_ var.build.manifests[-1]
execute if data storage slimecore:_ var.build.manifests[0] run function slimecore:_/build/pass_3/each
