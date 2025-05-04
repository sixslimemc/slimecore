#> slimecore:_/impl/evaluate/manifest/datafix/requirements/fix/order_spec
#--------------------
# ../each
#--------------------

execute if data storage slimecore:_ impl.manifest.datafix.fix{order_spec:'ANY'} run return run data modify storage slimecore:_ impl.manifest.datafix.fix.order_spec set value 0b
execute if data storage slimecore:_ impl.manifest.datafix.fix{order_spec:'BEFORE'} run return run data modify storage slimecore:_ impl.manifest.datafix.fix.order_spec set value 1b
execute if data storage slimecore:_ impl.manifest.datafix.fix{order_spec:'AFTER'} run return run data modify storage slimecore:_ impl.manifest.datafix.fix.order_spec set value -1b

# unnecessary, essentially an assertion.
execute store result storage slimecore:_ impl.manifest.datafix.fix.order_spec byte 1 run data get storage slimecore:_ impl.manifest.datafix.fix.order_spec