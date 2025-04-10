#> slimecore:_/impl/manifest/datafix/do
#--------------------
# ../main
#--------------------

# initial:
data modify storage slimecore:_ impl.manifest.final set from storage slimecore:_ impl.manifest.in

# deps:
data remove storage slimecore:_ impl.manifest.datafix.requirements.out
data modify storage slimecore:_ impl.manifest.datafix.requirements.in set from storage slimecore:_ impl.manifest.in.dependencies
execute if data storage slimecore:_ impl.manifest.datafix.requirements.in[0] run function slimecore:_/impl/manifest/datafix/requirements/each

data modify storage slimecore:_ impl.manifest.final.dependencies set from storage slimecore:_ impl.manifest.datafix.requirements.out

# sups:
data remove storage slimecore:_ impl.manifest.datafix.requirements.out
data modify storage slimecore:_ impl.manifest.datafix.requirements.in set from storage slimecore:_ impl.manifest.in.supports
execute if data storage slimecore:_ impl.manifest.datafix.requirements.in[0] run function slimecore:_/impl/manifest/datafix/requirements/each

data modify storage slimecore:_ impl.manifest.final.supports set from storage slimecore:_ impl.manifest.datafix.requirements.out

# impls:
data remove storage slimecore:_ impl.manifest.datafix.provisions.out
data modify storage slimecore:_ impl.manifest.datafix.provisions.in set from storage slimecore:_ impl.manifest.in.implements
execute if data storage slimecore:_ impl.manifest.datafix.provisions.in[0] run function slimecore:_/impl/manifest/datafix/provisions/each

data modify storage slimecore:_ impl.manifest.final.implements set from storage slimecore:_ impl.manifest.datafix.provisions.out

return 1