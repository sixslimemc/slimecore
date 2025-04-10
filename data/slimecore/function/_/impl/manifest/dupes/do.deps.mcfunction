#> slimecore:_/impl/manifest/dupes/do.deps
#--------------------
# ../main
#--------------------

data remove storage slimecore:_ impl.manifest.throw

data modify storage slimecore:_ impl.manifest.dupes.entries set from storage slimecore:_ impl.manifest.in.dependencies
data modify storage slimecore:_ impl.manifest.dupes.entries append from storage slimecore:_ impl.manifest.in.supports[]
data modify storage slimecore:_ impl.manifest.dupes.seen set value []
execute if data storage slimecore:_ impl.manifest.dupes.entries[0] run function slimecore:_/impl/manifest/dupes/each

execute if data storage slimecore:_ impl.manifest.throw.data run data merge storage slimecore:_ {impl:{manifest:{throw:{error:3}}}}
execute if data storage slimecore:_ impl.manifest.throw.error run return run function slimecore:_/impl/manifest/error/throw

return 1