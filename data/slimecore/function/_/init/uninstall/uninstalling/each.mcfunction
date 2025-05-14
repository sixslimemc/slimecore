#> slimecore:_/init/uninstall/uninstalling/each
#--------------------
# ../do
#--------------------

$data remove storage slimecore:_ var.init.packs[{pack:'$(pack)'}]

$function #$(pack):uninstall

data remove storage slimecore:_ manifests.uninstalling[0]
execute if data storage slimecore:_ manifests.uninstalling[0] run function slimecore:_/init/uninstall/uninstalling/each with storage slimecore:_ var.init.uninstalling[0]