#> slimecore:_/impl/manifest/validate/main
#--------------------
# ../main
#--------------------

data remove storage slimecore:_ impl.manifest.throw

execute store success score *x _slimecore run function slimecore:_/impl/manifest/validate/pack with storage slimecore:_ impl.manifest.in
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'pack', expected:"valid datapack namespace"}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.in.pack

execute store success score *x _slimecore run function slimecore:_/impl/manifest/validate/pack with storage slimecore:_ impl.manifest.in
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'pack', expected:"valid datapack namespace"}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.in.pack