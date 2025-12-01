#> slimecore : validate/pack_manifest
#--------------------
# -> pack: PackManifest
#--------------------
# <- result: (
# {
#     success: true
# }
# | {
#     error: {

#     }
# })
#--------------------
# TODO: description
#--------------------
# 1: success.
# 0: error.
#--------------------

data remove storage slimecore:out pack_manifest

execute store result score *x _slimecore run function slimecore:_/impl/validate/pack_manifest/main

data remove storage slimecore:_ v.pack_manifest
data remove storage slimecore:in pack_manifest

return run scoreboard players get *x _slimecore