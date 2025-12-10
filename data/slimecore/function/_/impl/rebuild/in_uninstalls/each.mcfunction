# IMPL > slimecore:rebuild
# in_uninstalls/each
#--------------------
# ../process
#--------------------

data modify storage slimecore:_ v.rebuild.this_uninstall set from storage slimecore:in rebuild.uninstall[-1]

function slimecore:_/impl/rebuild/in_uninstalls/each.1 with storage slimecore:_ v.rebuild.this_uninstall

data remove storage slimecore:in rebuild.uninstall[-1]
execute if data storage slimecore:in rebuild.uninstall[0] run function slimecore:_/impl/rebuild/in_uninstalls/each