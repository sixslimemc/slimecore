#> slimecore:_/impl/evaluate/manifest/validate/nonneg_number
#--------------------
# ./do
# ./composite/pack_requirement
#--------------------

$scoreboard players set *x _slimecore $(nonneg_number)
execute if score *x _slimecore matches ..-1 run return fail
return 1