#> slimecore:_/build/pass_2/get_deps
#--------------------
# ./eval
#--------------------

data modify storage slimecore:_ var.build.relstack[-1].deps set value []

data remove storage slimecore:_ var.build.retrieved_man
$data modify storage slimecore:_ var.build.retrieved_man set from storage slimecore:_ var.build.maps.manifests.'$(pack)'

function slimecore:_/build/pass_2/loads/relation/get_deps.1 with storage slimecore:_ var.build