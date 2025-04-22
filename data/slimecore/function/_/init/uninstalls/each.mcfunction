#> slimecore:_/init/uninstalls/each
#--------------------
# ../main
#--------------------

function slimecore:_/init/uninstalls/call_uninstall with storage slimecore:_ manifests.uninstalling[-1]

data remove storage slimecore:_ manifests.uninstalling[-1]
execute if data storage slimecore:_ manifests.uninstalling[0] run function slimecore:_/init/uninstalls/each