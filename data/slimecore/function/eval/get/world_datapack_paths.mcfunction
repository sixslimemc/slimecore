#> slimecore : eval/get/world_datapack_paths

data remove storage slimecore:out world_datapack_paths

execute store result score *x _slimecore run function slimecore:_/impl/eval/get/world_datapack_paths/main

data remove storage slimecore:_ v.world_datapack_paths
data remove storage slimecore:in world_datapack_paths

return run scoreboard players get *x _slimecore