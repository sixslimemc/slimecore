#> slimecore:_/build/first_pass/each
#--------------------
# ../start
#--------------------

data modify storage slimecore:_ var.build.this_manifest set from storage slimecore:_ var.build.manifests[-1]

# check duplicate manifests:
function slimecore:_/build/first_pass/each.1 with storage slimecore:_ var.build.this_manifest

data remove storage slimecore:_ var.build.manifests[-1]
execute if data storage slimecore:_ var.build.manifests[0] run function slimecore:_/build/first_pass/each