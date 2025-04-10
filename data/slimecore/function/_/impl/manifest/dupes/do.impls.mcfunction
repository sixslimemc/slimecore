#> slimecore:_/impl/manifest/dupes/do.impls
#--------------------
# ../main
#--------------------

data remove storage slimecore:_ impl.manifest.throw

data modify storage slimecore:_ impl.manifest.dupes.seen set value []
data modify storage slimecore:_ impl.manifest.dupes.entries set value []

data modify storage slimecore:_ impl.manifest.implfix.implfixes set from storage slimecore:_ impl.manifest.in.implements
execute if data storage slimecore:_ impl.manifest.dupes.implfixes[0] run function slimecore:_/impl/manifest/implfix/each
data modify storage slimecore:_ impl.manifest.dupes.entries set from storage slimecore:_ impl.manifest.implfix.fixed
execute if data storage slimecore:_ impl.manifest.dupes.entries[0] run function slimecore:_/impl/manifest/dupes/each

execute if data storage slimecore:_ impl.manifest.throw.data run data merge storage slimecore:_ {impl:{manifest:{throw:{error:4}}}}
execute if data storage slimecore:_ impl.manifest.throw.error run return run function slimecore:_/impl/manifest/error/throw

return 1