#> slimecore : api/manifest

data remove storage slimecore:out manifest

execute store result score *x _slimecore run function slimecore:_/impl/api/manifest/main

data remove storage slimecore:_ v.manifest
data remove storage slimecore:in manifest

return run scoreboard players get *x _slimecore