#> slimecore:_/build/pass_1/check_dupe
#--------------------
# ./each
#--------------------

data remove storage slimecore:_ var.build.dupe
data remove storage slimecore:_ var.build.dupe_entry
$execute store success score *x _slimecore run data modify storage slimecore:_ var.build.dupe set from storage slimecore:_ var.build.maps.manifests.'$(pack)'
$execute store success score *build.has_error_entry _slimecore run data modify storage slimecore:_ var.build.dupe_entry set from storage slimecore:_ var.build.error.duplicates[{pack:'$(pack)'}]
execute if score *x _slimecore matches 1 run function slimecore:_/build/pass_1/dupe_found with storage slimecore:_ var.build.this_man

execute if score *x _slimecore matches 1 run return 1
return fail
$data modify storage slimecore:_ var.build.maps.manifests.'$(pack)' set from storage slimecore:_ var.build.this_man