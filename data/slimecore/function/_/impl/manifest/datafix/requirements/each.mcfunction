#> slimecore:_/impl/manifest/datafix/requirements/each
#--------------------
# ../do
#--------------------

data modify storage slimecore:_ impl.manifest.datafix.this_req set from storage slimecore:_ impl.manifest.datafix.requirements.in[-1]

# order:
execute unless data storage slimecore:_ impl.manifest.datafix.this_req.order.pre_load run data merge storage slimecore:_ {impl:{manifest:{datafix:{this_req:{order:{pre_load:1b}}}}}}
data modify storage slimecore:_ impl.manifest.datafix.fix.order_spec set from storage slimecore:_ impl.manifest.datafix.this_req.order.pre_load
function slimecore:_/impl/manifest/datafix/requirements/fix/order_spec
data modify storage slimecore:_ impl.manifest.datafix.this_req.order.pre_load set from storage slimecore:_ impl.manifest.datafix.fix.order_spec

execute unless data storage slimecore:_ impl.manifest.datafix.this_req.order.load run data merge storage slimecore:_ {impl:{manifest:{datafix:{this_req:{order:{load:1b}}}}}}
data modify storage slimecore:_ impl.manifest.datafix.fix.order_spec set from storage slimecore:_ impl.manifest.datafix.this_req.order.load
function slimecore:_/impl/manifest/datafix/requirements/fix/order_spec
data modify storage slimecore:_ impl.manifest.datafix.this_req.order.load set from storage slimecore:_ impl.manifest.datafix.fix.order_spec

execute unless data storage slimecore:_ impl.manifest.datafix.this_req.order.post_load run data merge storage slimecore:_ {impl:{manifest:{datafix:{this_req:{order:{post_load:1b}}}}}}
data modify storage slimecore:_ impl.manifest.datafix.fix.order_spec set from storage slimecore:_ impl.manifest.datafix.this_req.order.post_load
function slimecore:_/impl/manifest/datafix/requirements/fix/order_spec
data modify storage slimecore:_ impl.manifest.datafix.this_req.order.post_load set from storage slimecore:_ impl.manifest.datafix.fix.order_spec

data modify storage slimecore:_ impl.manifest.datafix.requirements.out append from storage slimecore:_ impl.manifest.datafix.this_req

data remove storage slimecore:_ impl.manifest.datafix.requirements.in[-1]
execute if data storage slimecore:_ impl.manifest.datafix.requirements.in[0] run function slimecore:_/impl/manifest/datafix/requirements/each