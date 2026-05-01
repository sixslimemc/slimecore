# IMPL > slimecore:rebuild
# post_disables/each
#--------------------
# ../main
#--------------------
# these should already be SlimeCore disabled, just re-disabling them from process enabling them for manifest collection.

function slimecore:_/impl/rebuild/post_disables/disable with storage slimecore:_ v.rebuild.post_disables[-1]

data remove storage slimecore:_ v.rebuild.post_disables[-1]
execute if data storage slimecore:_ v.rebuild.post_disables[0] run function slimecore:_/impl/rebuild/post_disables/each