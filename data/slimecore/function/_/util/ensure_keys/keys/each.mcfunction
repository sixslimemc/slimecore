#> slimecore:_/util/ensure_keys/keys/each
#--------------------
# ../main
#--------------------

data modify storage slimecore:_ u.ensure_keys.key set from storage slimecore:_/in ensure_keys.keys[-1]

data modify storage slimecore:_/out ensure_keys.not_present append from storage slimecore:_ u.ensure_keys.key
function slimecore:_/util/ensure_keys/keys/check with storage slimecore:_ u.ensure_keys

data remove storage slimecore:_/in ensure_keys.keys[-1]
execute if data storage slimecore:_/in ensure_keys.keys[0] run function slimecore:_/util/ensure_keys/keys/each