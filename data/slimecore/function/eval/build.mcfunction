#> slimecore : eval/build

data remove storage slimecore:out build

execute store result score *x _slimecore run function slimecore:_/impl/eval/build/main

scoreboard players reset *build.error _slimecore
scoreboard players reset *build.index _slimecore
scoreboard players reset *build.insert_index _slimecore
data remove storage slimecore:_ v.build
data remove storage slimecore:in build

return run scoreboard players get *x _slimecore