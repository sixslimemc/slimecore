# IMPL > slimecore:rebuild
# safety_check/packs/each
#--------------------
# ../do
#--------------------

data modify storage slimecore:_ v.rebuild.this_pack set from storage slimecore:_ v.rebuild.pack_checks[-1]

function slimecore:_/impl/rebuild/safety_check/packs/each.1 with storage slimecore:_ v.rebuild.this_pack

data remove storage slimecore:_ v.rebuild.pack_checks[-1]
execute if data storage slimecore:_ v.rebuild.pack_checks[0] run function slimecore:_/impl/rebuild/safety_check/packs/each