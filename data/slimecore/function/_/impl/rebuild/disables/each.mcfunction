# IMPL > slimecore:rebuild
# disables/each
#--------------------
# ../process
#--------------------

function slimecore:_/impl/rebuild/disables/remove_pack with storage slimecore:_ v.build.rebuild.disables[-1]

data remove storage slimecore:_ v.rebuild.disables[-1]
execute if data storage slimecore:_ v.rebuild.disables[0] run function slimecore:_/impl/rebuild/disables/each