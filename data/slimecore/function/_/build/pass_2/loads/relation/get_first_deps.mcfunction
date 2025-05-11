#> slimecore:_/build/pass_2/get_deps
#--------------------
# ./eval
#--------------------

data modify storage slimecore:_ var.build.relstack[-1].deps set value []

data remove storage slimecore:_ var.build.retrieved_man
$data modify storage slimecore:_ var.build.retrieved_man set from storage slimecore:_ var.build.maps.manifests.'$(pack)'

data modify storage slimecore:_ var.build.relstack[-1].deps append from storage slimecore:_ var.build.retrieved_man.dependencies[]
data modify storage slimecore:_ var.build.relstack[-1].deps append from storage slimecore:_ var.build.retrieved_man.supports[]