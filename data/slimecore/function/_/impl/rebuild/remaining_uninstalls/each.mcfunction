# IMPL > slimecore:rebuild
# remaining_uninstalls/each
#--------------------
# ../process
#--------------------

function slimecore:_/impl/rebuild/uninstall with storage slimecore:_ v.rebuild.uninstalling[-1]

data remove storage slimecore:_ v.rebuild.uninstalling[-1]
execute if data storage slimecore:_ v.rebuild.uninstalling[0] run function slimecore:_/impl/rebuild/remaining_uninstalls/each