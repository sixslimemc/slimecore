#> slimecore:_/impl/manifest/validate/composite/pack_requirement
#--------------------
# ./do
#--------------------

# pack:
data modify storage slimecore:_ impl.manifest.validate.pack set from storage slimecore:_ impl.manifest.validate.pack_requirement.pack
execute store success score *x _slimecore run function slimecore:_/impl/manifest/validate/pack with storage slimecore:_ impl.manifest.validate
$execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'$(root_path).pack', expected:'valid datapack namespace'}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.validate.pack_requirement.pack

# version:
data modify storage slimecore:_ impl.manifest.validate.number set from storage slimecore:_ impl.manifest.validate.pack_requirement.version.major
execute store success score *x _slimecore run function slimecore:_/impl/manifest/validate/number with storage slimecore:_ impl.manifest.validate
$execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'$(root_path).version.major', expected:'integer'}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.validate.pack_requirement.version.major

data modify storage slimecore:_ impl.manifest.validate.number set from storage slimecore:_ impl.manifest.validate.pack_requirement.version.minor
execute store success score *x _slimecore run function slimecore:_/impl/manifest/validate/number with storage slimecore:_ impl.manifest.validate
$execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'$(root_path).version.minor', expected:'integer'}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.validate.pack_requirement.version.minor

# order:
data modify storage slimecore:_ impl.manifest.validate.order_spec set from storage slimecore:_ impl.manifest.validate.pack_requirement.order.pre_load
execute store success score *x _slimecore run function slimecore:_/impl/manifest/validate/order_spec with storage slimecore:_ impl.manifest.validate
$execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'$(root_path).order.pre_load', expected:'0b | 1b | -1b (or "ANY" | "BEFORE" | "AFTER" respectively)'}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.validate.pack_requirement.order.pre_load

data modify storage slimecore:_ impl.manifest.validate.order_spec set from storage slimecore:_ impl.manifest.validate.pack_requirement.order.load
execute store success score *x _slimecore run function slimecore:_/impl/manifest/validate/order_spec with storage slimecore:_ impl.manifest.validate
$execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'$(root_path).order.load', expected:'0b | 1b | -1b (or "ANY" | "BEFORE" | "AFTER" respectively)'}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.validate.pack_requirement.order.load

data modify storage slimecore:_ impl.manifest.validate.order_spec set from storage slimecore:_ impl.manifest.validate.pack_requirement.order.post_load
execute store success score *x _slimecore run function slimecore:_/impl/manifest/validate/order_spec with storage slimecore:_ impl.manifest.validate
$execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'$(root_path).order.post_load', expected:'0b | 1b | -1b (or "ANY" | "BEFORE" | "AFTER" respectively)'}
execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.validate.pack_requirement.order.post_load