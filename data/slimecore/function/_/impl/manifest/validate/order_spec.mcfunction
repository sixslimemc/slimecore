#> slimecore:_/impl/manifest/validate/order_spec
#--------------------
# ./composite/pack_requirement
#--------------------


execute unless data storage slimecore:_ impl.manifest.validate{order_spec:1b} unless data storage slimecore:_ impl.manifest.validate{order_spec:0b} unless data storage slimecore:_ impl.manifest.validate{order_spec:-1b} unless data storage slimecore:_ impl.manifest.validate{order_spec:'BEFORE'} unless data storage slimecore:_ impl.manifest.validate{order_spec:'ANY'} unless data storage slimecore:_ impl.manifest.validate{order_spec:'AFTER'} run return fail
return 1