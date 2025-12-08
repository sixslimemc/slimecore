# IMPL > slimecore:rebuild
# new_packs/each
#--------------------
# ../process
#--------------------

data modify storage slimecore:_ v.rebuild.this_pack set from storage slimecore:_ v.rebuild.packs[-1]



data remove storage slimecore:_ v.rebuild.packs[-1]
execute if data storage slimecore:_ v.rebuild.packs[0] run function slimecore:_/impl/rebuild/new_packs/each