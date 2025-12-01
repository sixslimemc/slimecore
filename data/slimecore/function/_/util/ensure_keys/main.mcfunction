#> slimecore :_/ ensure_keys
#--------------------
# -> value: any
# -> keys: [string]
#--------------------
# <- not_present: [string]
#--------------------
# TODO: description
#--------------------
# 1.
#--------------------

data remove storage slimecore:_/out ensure_keys

data modify storage slimecore:_/out ensure_keys.not_present set value []
execute if data storage slimecore:_/in ensure_keys.keys[0] run function slimecore:_/util/ensure_keys/keys/each

data remove storage slimecore:_ u.ensure_keys
data remove storage slimecore:_/in ensure_keys

return 1