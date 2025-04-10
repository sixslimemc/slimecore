#> slimecore:_/impl/manifest/contains_impl/check_contains
#--------------------
# ./each
#--------------------

$execute unless data storage slimecore:_ impl.manifest.contains.deps[{pack:'$(pack)'}] run return fail
return 1
