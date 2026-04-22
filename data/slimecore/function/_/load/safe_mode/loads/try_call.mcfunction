#> slimecore:_/load/safe_mode/loads/each.1

# dont call if not in {..unsafe_calls}:
$execute store success score *x _slimecore run data remove storage slimecore:_ v.rebuild.unsafe_calls[{pack_ref:"$(pack_ref)"}]
execute if score *x _slimecore matches 0 run return 0

tellraw @a {text:"calling #$(pack_ref):safe_mode"}

# HOOK: meta_info/call/safe_mode
$data modify storage slimecore:hook safe_mode set value {pack_id:"$(pack_ref)"}
function #slimecore:hook/meta_info/call/safe_mode

$function #$(pack_ref):safe_mode