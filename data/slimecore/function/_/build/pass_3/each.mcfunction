#> slimecore:_/build/pass_3/each
#--------------------
# ../main
#--------------------

data modify storage slimecore:_ var.build.this_man set from storage slimecore:_ var.build.manifests[-1]

# deps:
data modify storage slimecore:_ var.build.deps set from storage slimecore:_ var.build.this_man.dependencies
execute if data storage slimecore:_ var.build.deps[0] run function slimecore:_/build/pass_3/deps/each

# implemented check:
execute if data storage slimecore:_ var.build.this_man{abstract:true} run function slimecore:_/build/pass_3/impl_check with storage slimecore:_ var.build.this_man

data remove storage slimecore:_ var.build.manifests[-1]
execute if data storage slimecore:_ var.build.manifests[0] run function slimecore:_/build/pass_3/each
