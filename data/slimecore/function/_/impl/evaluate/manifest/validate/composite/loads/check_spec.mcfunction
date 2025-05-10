#> slimecore:_/impl/evaluate/manifest/validate/composite/loads/check_spec
#--------------------
# ./each
#--------------------

# order:
$data modify storage slimecore:_ impl.manifest.validate.order_spec set from storage slimecore:_ impl.manifest.validate.load_spec.'$(this_load)'
execute store success score *x _slimecore run function slimecore:_/impl/evaluate/manifest/validate/order_spec
#- make optional:
$execute unless data storage slimecore:_ impl.manifest.validate.load_spec.'$(this_load)' run scoreboard players set *x _slimecore 1
$execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances append value {field:'$(root_path).$(this_load)', expected:'0b | 1b | -1b | "ANY" | "BEFORE" | "AFTER"'}
$execute unless score *x _slimecore matches 1 run data modify storage slimecore:_ impl.manifest.throw.data.instances[-1].got set from storage slimecore:_ impl.manifest.validate.load_spec.'$(this_load)'