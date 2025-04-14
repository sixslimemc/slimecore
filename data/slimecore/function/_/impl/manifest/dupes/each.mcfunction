#> slimecore:_/impl/manifest/dupes/each
#--------------------
# ./do
#--------------------

data modify storage slimecore:_ impl.manifest.dupes.this_entry set from storage slimecore:_ impl.manifest.dupes.entries[-1]

execute store result score *x _slimecore run function slimecore:_/impl/manifest/dupes/check_seen with storage slimecore:_ impl.manifest.dupes.this_entry

execute if score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append from storage slimecore:_ impl.manifest.dupes.dupe[0]
execute if score *x _slimecore matches 1.. run data modify storage slimecore:_ impl.manifest.throw.data.instances append from storage slimecore:_ impl.manifest.dupes.this_entry


data modify storage slimecore:_ impl.manifest.dupes.seen append from storage slimecore:_ impl.manifest.dupes.this_entry

data remove storage slimecore:_ impl.manifest.dupes.entries[-1]
execute if data storage slimecore:_ impl.manifest.dupes.entries[0] run function slimecore:_/impl/manifest/dupes/each