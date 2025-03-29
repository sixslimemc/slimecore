#> slimecore:_/build/first_pass/duplicate_found
#--------------------
# ./each.1
#--------------------

scoreboard players set *build.error _slimecore 1

execute unless data storage slimecore:_ build.errors.duplicates[] run data modify storage slimecore:_ build.errors.duplicates append from storage slimecore:_ build.first_duplicate

data modify storage slimecore:_ build.errors.duplicates append from storage slimecore:_ build.this_manifest