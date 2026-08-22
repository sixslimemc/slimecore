# IMPL > slimecore:rebuild
# remaining_uninstalls/each
#--------------------
# ../process
#--------------------

data modify storage slimecore:_ v.rebuild.this_uninstall set from storage slimecore:_ v.rebuild.uninstalling[-1]
function slimecore:_/impl/rebuild/remaining_uninstalls/each.1 with storage slimecore:_ v.rebuild.this_uninstall

data remove storage slimecore:_ v.rebuild.uninstalling[-1]
execute if data storage slimecore:_ v.rebuild.uninstalling[0] run function slimecore:_/impl/rebuild/remaining_uninstalls/each