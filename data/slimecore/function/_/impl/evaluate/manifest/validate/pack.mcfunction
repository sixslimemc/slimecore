#> slimecore:_/impl/evaluate/manifest/validate/pack
#--------------------
# ./do
# ./composite/pack_requirement
#--------------------

scoreboard players operation *x _slimecore = *manifest.validate.allow_self _slimecore
scoreboard players reset *manifest.validate.allow_self _slimecore
$execute unless score *x _slimecore matches 1 if data storage slimecore:_ impl.manifest.in{pack:'$(pack)'} run return fail
execute if data storage slimecore:_ impl.manifest.validate{pack:""} run return fail
execute if data storage slimecore:_ impl.manifest.validate{pack:"minecraft"} run return fail
$execute unless data storage $(pack):data {}
return 1