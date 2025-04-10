#> slimecore:_/build/first_pass/impls/check_seen
#--------------------
# ./each
#--------------------

$execute store success score *x _slimecore run data modify storage slimecore:_ var.build.seen_source storage slimecore:_ var.build.seen_impls.$(pack)
$execute store success score *build.has_error_entry _slimecore run data modify storage slimecore:_ var.build.seen_entry set from storage slimecore:_ var.build.error.multiple_implementations[{pack:'$(pack)'}]
execute store success score *x _slimecore if score *x _slimecore matches 1 run function slimecore:_/build/first_pass/impls/seen with storage slimecore:_ var.build.this_impl

execute if score *x _slimecore matches 1 run return 1
return fail