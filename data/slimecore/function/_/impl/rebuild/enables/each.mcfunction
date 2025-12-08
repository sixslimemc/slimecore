# IMPL > slimecore:rebuild
# enables/each
#--------------------
# ../process
#--------------------

function slimecore:_/impl/rebuild/enables/remove_disable with storage slimecore:_ v.build.rebuild.enables[-1]

data remove storage slimecore:_ v.rebuild.enables[-1]
execute if data storage slimecore:_ v.rebuild.enables[0] run function slimecore:_/impl/rebuild/enables/each