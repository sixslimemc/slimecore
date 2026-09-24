#> slimecore:_/load/entrypoints/call
#--------------------
# ./each
#--------------------

# HOOK : call/pre/entrypoint
$execute if data storage slimecore:_ t.load{tag_key:"entrypoint"} run data modify storage slimecore:hook entrypoint set value {pack_id:"$(pack_ref)", id:"$(id)"}
execute if data storage slimecore:_ t.load{tag_key:"entrypoint"} run function #slimecore:hook/call/pre/entrypoint
data remove storage slimecore:hook entrypoint

# HOOK : call/pre/preload_entrypoint
$execute if data storage slimecore:_ t.load{tag_key:"preload_entrypoint"} run data modify storage slimecore:hook preload_entrypoint set value {pack_id:"$(pack_ref)", id:"$(id)"}
execute if data storage slimecore:_ t.load{tag_key:"preload_entrypoint"} run function #slimecore:hook/call/pre/preload_entrypoint
data remove storage slimecore:hook preload_entrypoint

$function #$(pack_ref):$(tag_key)/$(id)

# HOOK : call/post/entrypoint
$execute if data storage slimecore:_ t.load{tag_key:"entrypoint"} run data modify storage slimecore:hook entrypoint set value {pack_id:"$(pack_ref)", id:"$(id)"}
execute if data storage slimecore:_ t.load{tag_key:"entrypoint"} run function #slimecore:hook/call/post/entrypoint
data remove storage slimecore:hook entrypoint

# HOOK : call/post/preload_entrypoint
$execute if data storage slimecore:_ t.load{tag_key:"preload_entrypoint"} run data modify storage slimecore:hook preload_entrypoint set value {pack_id:"$(pack_ref)", id:"$(id)"}
execute if data storage slimecore:_ t.load{tag_key:"preload_entrypoint"} run function #slimecore:hook/call/post/preload_entrypoint
data remove storage slimecore:hook preload_entrypoint
