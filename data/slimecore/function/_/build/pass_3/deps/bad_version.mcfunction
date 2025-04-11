#> slimecore:_/build/pass_3/bad_version
#--------------------
# ./version_check
#--------------------

scoreboard players set *build.error _slimecore 1

data modify storage slimecore:_ var.build.entry_add set value {}
data modify storage slimecore:_ var.build.entry_add.dependency set from storage slimecore:_ var.build.this_dep
data modify storage slimecore:_ var.build.entry_add.dependent set from storage slimecore:_ var.build.this_man
data modify storage slimecore:_ var.build.entry_add.bad_version.installed set from storage slimecore:_ var.build.installed_dep
execute store result storage slimecore:_ var.build.entry_add.bad_version.version_index byte 1 run scoreboard players get *build.bad_index _slimecore

data modify storage slimecore:_ var.build.error.missing_dependencies append from storage slimecore:_ var.build.entry_add

return 1