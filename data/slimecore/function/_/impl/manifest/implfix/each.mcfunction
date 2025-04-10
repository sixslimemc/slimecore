#> slimecore:_/impl/manifest/implfix/each
#--------------------
# ../do.impls
#--------------------

data modify storage slimecore:_ impl.manifest.implfix.this_implfix set from storage slimecore:_ impl.manifest.implfix.implfixes[-1]

execute unless data storage slimecore:_ impl.manifest.implfix.this_implfix.pack run function slimecore:_/impl/manifest/implfix/fix

data modify storage slimecore:_ impl.manifest.implfix.fixed append from storage slimecore:_ impl.manifest.implfix.this_implfix

data remove storage slimecore:_ impl.manifest.implfix.implfixes[-1]
execute if data storage slimecore:_ impl.manifest.implfix.implfixes[0] run function slimecore:_/impl/manifest/implfix/each