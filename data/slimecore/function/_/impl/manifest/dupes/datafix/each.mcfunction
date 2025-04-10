#> slimecore:_/impl/manifest/dupes/datafix/each
#--------------------
# ../do.impls
#--------------------

data modify storage slimecore:_ impl.manifest.dupes.this_datafix set from storage slimecore:_ impl.manifest.dupes.datafixes[-1]

execute unless data storage slimecore:_ impl.manifest.dupes.this_datafix.pack run function slimecore:_/impl/manifest/dupes/datafix/fix

data modify storage slimecore:_ impl.manifest.dupes.entries append from storage slimecore:_ impl.manifest.dupes.this_datafix

data remove storage slimecore:_ impl.manifest.dupes.datafixes[-1]
execute if data storage slimecore:_ impl.manifest.dupes.datafixes[0] run function slimecore:_/impl/manifest/dupes/datafix/each