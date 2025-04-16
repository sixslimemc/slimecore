#> slimecore:_/impl/manifest/main
#--------------------
# @api
#--------------------

execute unless score *manifest_time _slimecore matches 1 run return -2

execute store result score *x _slimecore run function slimecore:_/impl/evaluate/manifest/main

data modify storage slimecore:_ manifests append from storage slimecore:out manifest.result
execute unless score *x _slimecore matches 1.. run return -1
return 1