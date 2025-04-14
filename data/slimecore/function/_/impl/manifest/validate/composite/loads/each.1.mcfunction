#> slimecore:_/impl/manifest/validate/composite/loads/each.1

# order:
$data modify storage slimecore:_ impl.manifest.validate.order_spec set from storage slimecore:_ impl.manifest.validate.pack_requirement.order.'$(this_load)'
execute store success score *x _slimecore run function slimecore:_/impl/manifest/validate/order_spec
#- make optional:
$execute unless data storage slimecore:_ impl.manifest.validate.pack_requirement.order.'$(this_load)' run scoreboard players set *x _slimecore 1
$execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'$(root_path).order.$(this_load)', expected:'0b | 1b | -1b | "ANY" | "BEFORE" | "AFTER"'}
$execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.validate.pack_requirement.order.'$(this_load)'