# IMPL > slimecore:rebuild
# remaining_disables/each
#--------------------
# ../process
#--------------------

data modify storage slimecore:_ v.rebuild.this_disable set from storage slimecore:_ v.rebuild.disabling[-1]

function slimecore:_/impl/rebuild/remaining_disables/each.1 with storage slimecore:_ v.rebuild.this_disable

data remove storage slimecore:_ v.rebuild.disabling[-1]
execute if data storage slimecore:_ v.rebuild.disabling[0] run function slimecore:_/impl/rebuild/remaining_disables/each