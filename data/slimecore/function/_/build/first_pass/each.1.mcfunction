#> slimecore:_/build/first_pass/each.1

$data modify storage slimecore:_ var.build.first_duplicate set from storage slimecore:_ var.build.packmap.'$(pack)'
execute if data storage slimecore:_ var.build.first_duplicate run return run function slimecore:_/build/first_pass/duplicate_found

$data modify storage slimecore:_ var.build.pmap.manifests.'$(pack)' set from storage slimecore:_ var.build.this_manifest