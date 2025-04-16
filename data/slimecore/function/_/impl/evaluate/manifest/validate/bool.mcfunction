#> slimecore:_/impl/evaluate/manifest/validate/bool
#--------------------
# ./do
#--------------------

execute unless data storage slimecore:_ impl.manifest.validate{bool:true} unless data storage slimecore:_ impl.manifest.validate{bool:false} run return fail
return 1