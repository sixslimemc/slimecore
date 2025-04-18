#> slimecore:_/build/pass_3/not_installed
#--------------------
# ./each
#--------------------

scoreboard players set *build.error _slimecore 1

data modify storage slimecore:_ var.build.entry_add set value {}
data modify storage slimecore:_ var.build.entry_add.dependency set from storage slimecore:_ var.build.this_dep
data modify storage slimecore:_ var.build.entry_add.dependent set from storage slimecore:_ var.build.this_man

data modify storage slimecore:_ var.build.error.missing_dependencies append from storage slimecore:_ var.build.entry_add

return fail