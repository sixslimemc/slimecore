#> slimecore:_/impl/manifest/dupes/datafix/fix
#--------------------
# ./each
#--------------------

data modify storage slimecore:_ impl.manifest.dupes.fix set value {pack:''}
data modify storage slimecore:_ impl.manifest.dupes.fix.pack set from storage slimecore:_ impl.manifest.dupes.this_datafix

data modify storage slimecore:_ impl.manifest.dupes.this_datafix set from storage slimecore:_ impl.manifest.dupes.fix
