# IMPL > slimecore:rebuild
# in_disables/each
#--------------------
# ../process
#--------------------

data modify storage slimecore:_ v.rebuild.this_disable set from storage slimecore:in rebuild.disable[-1]

function slimecore:_/impl/rebuild/in_disables/each.1 with storage slimecore:_ v.rebuild.this_disable

data remove storage slimecore:in rebuild.disable[-1]
execute if data storage slimecore:in rebuild.disable[0] run function slimecore:_/impl/rebuild/in_disables/each