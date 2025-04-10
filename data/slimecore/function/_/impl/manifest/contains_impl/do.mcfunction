#> slimecore:_/impl/manifest/contains_impl/do
#--------------------
# ../main
#--------------------

data remove storage slimecore:_ impl.manifest.throw

data modify storage slimecore:_ impl.manifest.contains.deps set from storage slimecore:_ impl.manifest.in.dependencies
data modify storage slimecore:_ impl.manifest.contains.deps append from storage slimecore:_ impl.manifest.in.supports[]
data modify storage slimecore:_ impl.manifest.contains.impls set from storage slimecore:_ impl.manifest.in.implements
execute if data storage slimecore:_ impl.manifest.contains.impls[0] run function slimecore:_/impl/manifest/contains_impl/each

execute if data storage slimecore:_ impl.manifest.throw.data run data merge storage slimecore:_ {impl:{manifest:{throw:{error:5}}}}
execute if data storage slimecore:_ impl.manifest.throw.error run return run function slimecore:_/impl/manifest/error/throw

return 1