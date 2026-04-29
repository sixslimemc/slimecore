# IMPL > slimecore:rebuild
# remaining_disables/each
#--------------------
# ../process
#--------------------

# DEBUG:
tellraw @a ["DISABLING: ", {'storage':'slimecore:_', 'nbt':'v.rebuild.disabling[-1]'}]

function slimecore:_/impl/rebuild/disable with storage slimecore:_ v.rebuild.disabling[-1]

data remove storage slimecore:_ v.rebuild.disabling[-1]
execute if data storage slimecore:_ v.rebuild.disabling[0] run function slimecore:_/impl/rebuild/remaining_uninstalls/each