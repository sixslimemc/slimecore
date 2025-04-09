#> slimecore:_/impl/manifest/validate/main
#--------------------
# ../main
#--------------------

data remove storage slimecore:_ impl.manifest.throw

# pack:
execute store success score *x _slimecore run function slimecore:_/impl/manifest/validate/pack with storage slimecore:_ impl.manifest.in
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'pack', expected:"valid datapack namespace"}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.in.pack

# version:
data modify storage slimecore:_ impl.manifest.validate.number set from storage slimecore:_ impl.manifest.in.version.major
execute store success score *x _slimecore run function slimecore:_/impl/manifest/validate/number with storage slimecore:_ impl.manifest.validate
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'version.major', expected:"integer"}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.in.version.major

data modify storage slimecore:_ impl.manifest.validate.number set from storage slimecore:_ impl.manifest.in.version.minor
execute store success score *x _slimecore run function slimecore:_/impl/manifest/validate/number with storage slimecore:_ impl.manifest.validate
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'version.minor', expected:"integer"}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.in.version.minor

data modify storage slimecore:_ impl.manifest.validate.number set from storage slimecore:_ impl.manifest.in.version.patch
execute store success score *x _slimecore run function slimecore:_/impl/manifest/validate/number with storage slimecore:_ impl.manifest.validate
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'version.patch', expected:"integer"}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.in.version.patch

# abstract:
data modify storage slimecore:_ impl.manifest.validate.bool set from storage slimecore:_ impl.manifest.in.abstract
execute store success score *x _slimecore run function slimecore:_/impl/manifest/validate/bool
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'abstract', expected:"boolean"}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.in.abstract