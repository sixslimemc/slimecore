#> slimecore:_/impl/manifest/dupe_deps/each
#--------------------
# ./do
#--------------------

data modify storage slimecore:_ impl.manifest.dupes.this_dep set from storage slimecore:_ impl.manifest.dupes.deps[-1]

execute store result score *x _slimecore run function slimecore:_/impl/manifest/dupe_deps/check_seen with storage slimecore:_ impl.manifest.dupes.this_dep

execute if score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append from storage slimecore:_ impl.manifest.dupes.dupe
execute if score *x _slimecore matches 1.. run data modify storage slimecore:_ impl.manifest.throw.data.instances append from storage slimecore:_ impl.manifest.dupes.this_dep

data modify storage slimecore:_ impl.manifest.dupes.seen append from storage slimecore:_ impl.manifest.dupes.this_dep

data remove storage slimecore:_ impl.manifest.dupes.deps[-1]
execute if data storage slimecore:_ impl.manifest.dupes.deps[0] run function slimecore:_/impl/manifest/dupe_deps/each