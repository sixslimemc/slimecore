#> slimecore : eval/get/standard_datapack_paths

data remove storage slimecore:out standard_datapack_paths

execute store result score *x _slimecore run function slimecore:_/impl/eval/get/standard_datapack_paths/main

data remove storage slimecore:_ v.standard_datapack_paths
data remove storage slimecore:in standard_datapack_paths

return run scoreboard players get *x _slimecore