# IMPL > slimecore:rebuild
# uninstall
#--------------------
# ./closing_pass/each.1
# ./remaining_uninstalls/each
#--------------------

$data modify storage slimecore:_ v.rebuild.call_disable set value bool($(call_disable))

# call disable if needed:
data modify storage slimecore:_ v.rebuild.disable_from_uninstall set value true
$execute if data storage slimecore:_ v.rebuild{call_disable:true} run function slimecore:_/impl/rebuild/disable {pack_ref:"$(pack_ref)", call_tag:true}
data remove storage slimecore:_ v.rebuild.disable_from_uninstall

# HOOK: meta_info/call/uninstall
$data modify storage slimecore:hook uninstall set value {pack_id:"$(pack_ref)"}
function #slimecore:hook/meta_info/call/uninstall
data remove storage slimecore:hook uninstall

$function #$(pack_ref):uninstall
$datapack disable "$(path)"