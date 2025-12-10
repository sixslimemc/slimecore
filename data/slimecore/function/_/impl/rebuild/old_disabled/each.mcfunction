# IMPL > slimecore:rebuild
# in_disabled/each
#--------------------
# ../process
#--------------------

data modify storage slimecore:_ v.rebuild.this_disable set from storage slimecore:_ v.rebuild.old_disabled[-1]



data remove storage slimecore:_ v.rebuild.old_disabled[-1]
execute if data storage slimecore:_ v.rebuild.old_disabled[0] run function slimecore:_/impl/rebuild/in_disabled/each