#> slimecore:_/build/first_pass/each.1

$data modify storage slimecore:_ build.first_duplicate set from storage slimecore:_ build.packmap.'$(pack)'
execute if data storage slimecore:_ build.first_duplicate run return run function slimecore:_/build/first_pass/duplicate_found

$data modify storage slimecore:_ build.pmap.manifests.'$(pack)' set from storage slimecore:_ build.this_manifest