#> slimecore:_/build/pass_1/impls/check_seen
#--------------------
# ./each
#--------------------

$execute store success score *build.seen_impl _slimecore run data modify storage slimecore:_ var.build.seen_source set from storage slimecore:_ var.build.maps.impls.'$(pack)'
$execute store success score *build.has_error_entry _slimecore run data modify storage slimecore:_ var.build.seen_entry set from storage slimecore:_ var.build.error.multiple_implementations[{pack:'$(pack)'}]

execute if score *build.seen_impl _slimecore matches 1 run function slimecore:_/build/pass_1/impls/seen with storage slimecore:_ var.build.this_impl

execute if score *build.seen_impl _slimecore matches 1 run return 1
return fail