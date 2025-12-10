# IMPL > slimecore:rebuild
# closing_pass/each
#--------------------
# ../process
#--------------------

data modify storage slimecore:_ v.rebuild.this_load set from storage slimecore:_ v.rebuild.load_order[-1]

function slimecore:_/impl/rebuild/closing_pass/each.1 with storage slimecore:_ v.rebuild.this_load

data remove storage slimecore:_ v.rebuild.load_order[-1]
execute if data storage slimecore:_ v.rebuild.load_order[0] run function slimecore:_/impl/rebuild/closing_pass/each