#> slimecore:_/impl/manifest/validate/pack
#--------------------
# ./do
# ./composite/pack_requirement
#--------------------

execute if data storage slimecore:_ impl.manifest.validate{pack:""} run return fail
execute if data storage slimecore:_ impl.manifest.validate{pack:"minecraft"} run return fail
$execute unless data storage $(pack):data {}
return 1