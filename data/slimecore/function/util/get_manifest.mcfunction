#> slimecore : util/get_manifest

data remove storage slimecore:out get_manifest

execute store result score *x _slimecore run function slimecore:_/impl/util/get_manifest/main with storage slimecore:in get_manifest

data remove storage slimecore:_ v.get_manifest
data remove storage slimecore:in get_manifest

return run scoreboard players get *x _slimecore