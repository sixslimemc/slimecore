#> slimecore:_/impl/manifest/contains_impl/each
#--------------------
# ../main
#--------------------

execute if data storage slimecore:_ impl.manifest.contains.impls[-1].pack run data modify storage slimecore:_ impl.manifest.contains.this_impl set from storage slimecore:_ impl.manifest.contains.impls[-1]
execute unless data storage slimecore:_ impl.manifest.contains.impls[-1].pack run data modify storage slimecore:_ impl.manifest.contains.this_impl.pack set from storage slimecore:_ impl.manifest.contains.impls[-1]

execute store success score *x _slimecore run function slimecore:_/impl/manifest/contains_impl/check_contains with storage slimecore:_ impl.manifest.contains.this_impl
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append from storage slimecore:_ impl.manifest.contains.this_impl

data remove storage slimecore:_ impl.manifest.contains.impls[-1]
execute if data storage slimecore:_ impl.manifest.contains.impls[0] run function slimecore:_/impl/manifest/contains_impl/each