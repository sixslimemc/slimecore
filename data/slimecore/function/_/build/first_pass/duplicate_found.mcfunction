#> slimecore:_/build/first_pass/duplicate_found
#--------------------
# ./each.1
#--------------------

scoreboard players set *build.error _slimecore 1

execute unless data storage slimecore:_ var.build.errors.duplicates[] run data modify storage slimecore:_ var.build.errors.duplicates append from storage slimecore:_ var.build.first_duplicate

data modify storage slimecore:_ var.build.errors.duplicates append from storage slimecore:_ var.build.this_manifest