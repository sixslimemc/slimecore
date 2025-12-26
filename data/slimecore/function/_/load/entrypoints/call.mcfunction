#> slimecore:_/load/entrypoints/call
#--------------------
# ./each
#--------------------

# HOOK: info/call/entrypoint
$execute if data storage slimecore:_ v.load{tag_key:"entrypoint"} run data modify storage slimecore:hook entrypoint set value {pack_ref:"$(pack_ref)", id:"$(id)"}
execute if data storage slimecore:_ v.load{tag_key:"entrypoint"} run function #slimecore:hook/info/call/entrypoint

# HOOK: info/call/preload_entrypoint
$execute if data storage slimecore:_ v.load{tag_key:"preload_entrypoint"} run data modify storage slimecore:hook preload_entrypoint set value {pack_ref:"$(pack_ref)", id:"$(id)"}
execute if data storage slimecore:_ v.load{tag_key:"preload_entrypoint"} run function #slimecore:hook/info/call/preload_entrypoint

$function #$(pack_ref):$(tag_key)/$(id)