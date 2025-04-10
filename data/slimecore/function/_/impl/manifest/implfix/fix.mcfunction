#> slimecore:_/impl/manifest/implfix/fix
#--------------------
# ./each
#--------------------

data modify storage slimecore:_ impl.manifest.implfix.fix set value {pack:''}
data modify storage slimecore:_ impl.manifest.implfix.fix.pack set from storage slimecore:_ impl.manifest.dupes.this_implfix

data modify storage slimecore:_ impl.manifest.implfix.this_implfix set from storage slimecore:_ impl.manifest.dupes.fix
