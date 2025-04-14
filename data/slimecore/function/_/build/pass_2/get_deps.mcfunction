#> slimecore:_/build/pass_2/get_deps
#--------------------
# ./each
#--------------------

data modify storage slimecore:_ var.build.depstack[-1].deps set value []

$data modify storage slimecore:_ var.build.retrieved_man set from storage slimecore:_ var.build.maps.manifests.'$(pack)'

data modify storage slimecore:_ var.build.depstack[-1].deps append from storage slimecore:_ var.build.retrieved_man.dependencies[]
data modify storage slimecore:_ var.build.depstack[-1].deps append from storage slimecore:_ var.build.retrieved_man.supports[]