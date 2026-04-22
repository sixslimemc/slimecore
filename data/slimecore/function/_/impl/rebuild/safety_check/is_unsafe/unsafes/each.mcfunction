# IMPL > slimecore:rebuild
# safety_check/is_unsafe/unsafes/each
#--------------------
# ../do
#--------------------

# {..this_unsafe.pack_id} must be present.
data modify storage slimecore:_ v.rebuild.this_unsafe set from storage slimecore:_ v.rebuild.unsafes[-1]

function slimecore:_/impl/rebuild/safety_check/is_unsafe/unsafes/each.1 with storage slimecore:_ v.rebuild.this_unsafe

data remove storage slimecore:_ v.rebuild.unsafes[-1]
execute if data storage slimecore:_ v.rebuild.unsafes[0] run function slimecore:_/impl/rebuild/safety_check/is_unsafe/unsafes/each