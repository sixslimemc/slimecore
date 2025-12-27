#> slimecore : eval/version_req

data remove storage slimecore:out version_req

execute store result score *x _slimecore run function slimecore:_/impl/eval/version_req/main

data remove storage slimecore:_ v.version_req
data remove storage slimecore:in version_req

return run scoreboard players get *x _slimecore