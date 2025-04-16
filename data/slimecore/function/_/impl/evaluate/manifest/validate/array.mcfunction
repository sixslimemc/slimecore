#> slimecore:_/impl/evaluate/manifest/validate/array
#--------------------
# ./do
#--------------------

execute if data storage slimecore:_ impl.manifest.validate.array[] run return 1
execute store success score *x _slimecore run data modify storage slimecore:_ impl.manifest.validate.array set value []
execute if score *x _slimecore matches 1 run return fail
return 1