#> slimecore:_/impl/manifest/datafix/provisions/each
#--------------------
# ../do
#--------------------

data modify storage slimecore:_ impl.manifest.datafix.provisions.out append value {}
execute if data storage slimecore:_ impl.manifest.datafix.provisions.in[-1].pack run data modify storage slimecore:_ impl.manifest.datafix.provisions.out[-1] set from storage slimecore:_ impl.manifest.datafix.provisions.in[-1]
execute unless data storage slimecore:_ impl.manifest.datafix.provisions.in[-1].pack run data modify storage slimecore:_ impl.manifest.datafix.provisions.out[-1].pack set from storage slimecore:_ impl.manifest.datafix.provisions.in[-1]

data remove storage slimecore:_ impl.manifest.datafix.provisions.in[-1]
execute if data storage slimecore:_ impl.manifest.datafix.provisions.in[0] run function slimecore:_/impl/manifest/datafix/provisions/each