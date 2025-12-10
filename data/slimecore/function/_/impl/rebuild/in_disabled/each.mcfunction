# IMPL > slimecore:rebuild
# in_disabled/each
#--------------------
# ../process
#--------------------

data modify storage slimecore:_ v.rebuild.this_disable set from storage slimecore:in rebuild.disable[-1]



data remove storage slimecore:in rebuild.disable[-1]
execute if data storage slimecore:in rebuild.disable[0] run function slimecore:_/impl/rebuild/in_disabled/each