#> slimecore:_/build/pass_3/installed_check
#--------------------
# ./each
#--------------------

data remove storage slimecore:_ var.build.installed_dep
$execute store success score *x _slimecore run data modify storage slimecore:_ var.build.installed_dep set from storage slimecore:_ var.build.maps.manifests.$(pack)
execute store success score *x _slimecore unless score *x _slimecore matches 1 run function slimecore:_/build/pass_3/deps/not_installed

execute if score *x _slimecore matches 1 run return fail
return 1