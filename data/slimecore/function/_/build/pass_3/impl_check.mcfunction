#> slimecore:_/build/pass_3/impl_check
#--------------------
# ./each
#--------------------

execute store success score *x _slimecore run data modify storage slimecore:_ var.build.
$execute unless data storage slimecore:_ var.build.maps.impls.$(pack) run function slimecore:_/build/pass_3/not_implemented with storage slimecore:_ var.build.this_man