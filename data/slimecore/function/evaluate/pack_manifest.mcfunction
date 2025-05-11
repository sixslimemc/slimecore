#> slimecore : evaluate/pack_manifest
#--------------------
# -> input: InputPackManifest | any
#--------------------
# <~ value? PackManifest
# <~ error? CompoundValidationError
#--------------------
# TODO: description
#--------------------
# 1: <input> is a valid InputPackManifest; >value< contains data.
# 0: <input> is not a valid InputPackManifest; >error< contains data.
#--------------------

data remove storage slimecore:out pack_manifest

execute store result score *x _slimecore run function slimecore:_/impl/evaluate/pack_manifest/main

execute if score *x _slimecore matches 0 run data remove storage slimecore:out pack_manifest.value

data remove storage slimecore:_ v.pack_manifest
data remove storage slimecore:in pack_manifest

return run scoreboard players get *x _slimecore