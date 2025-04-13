#> slimecore:_/build/end/success
#--------------------
# ../main
#--------------------

data modify storage slimecore:_ build.out.result.order set from storage slimecore:_ var.build.final_order
data modify storage slimecore:_ build.out.result.pack_map set from storage slimecore:_ var.build.maps.manifests

function slimecore:_/build/end/end
return 1
