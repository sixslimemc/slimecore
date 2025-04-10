#> slimecore:_/build/first_pass/each
#--------------------
# ../start
#--------------------

data modify storage slimecore:_ var.build.this_man set from storage slimecore:_ var.build.manifests[-1]

# check duplicate manifests:
function slimecore:_/build/first_pass/check_dupe with storage slimecore:_ var.build.this_man

data remove storage slimecore:_ var.build.manifests[-1]
execute if data storage slimecore:_ var.build.manifests[0] run function slimecore:_/build/first_pass/each