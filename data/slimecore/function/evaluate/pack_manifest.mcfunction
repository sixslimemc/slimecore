#> slimecore : evaluate/pack_manifest
#--------------------
# -> input: InputManifest | any
#--------------------
# <~ value? PackManifest
# <~ error? CompoundValidationError
#--------------------
# TODO: description
#--------------------
# 1: <input> is a valid InputManifest; >value< contains data.
# 0: <input> is not a valid InputManifest; >error< contains data.
#--------------------

data remove storage slimecore:out pack_manifest

execute store result score *x _slimecore run function slimecore:_/impl/evaluate/pack_manifest/main

data remove storage slimecore:_ v.pack_manifest
data remove storage slimecore:in pack_manifest

return run scoreboard players get *x _slimecore