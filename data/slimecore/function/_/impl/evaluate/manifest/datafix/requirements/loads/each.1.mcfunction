#> slimecore:_/impl/evaluate/manifest/datafix/requirements/loads/each.1

# order:
$execute unless data storage slimecore:_ impl.manifest.datafix.this_req.order.'$(this_load)' run data modify storage slimecore:_ impl.manifest.datafix.this_req.order.'$(this_load)' set from storage slimecore:_ const.default_load_order.'$(this_load)'
$data modify storage slimecore:_ impl.manifest.datafix.fix.order_spec set from storage slimecore:_ impl.manifest.datafix.this_req.order.'$(this_load)'
function slimecore:_/impl/evaluate/manifest/datafix/requirements/fix/order_spec
$data modify storage slimecore:_ impl.manifest.datafix.this_req.order.'$(this_load)' set from storage slimecore:_ impl.manifest.datafix.fix.order_spec