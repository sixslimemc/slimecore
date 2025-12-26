# IMPL > slimecore:rebuild
# uninstall
#--------------------
# ./closing_pass/each.1
# ./remaining_uninstalls/each
#--------------------

# HOOK: meta_info/call/uninstall
$data modify storage slimecore:hook uninstall set value {pack_ref:"$(pack_ref)"}
function #slimecore:hook/meta_info/call/uninstall

$function #$(pack_ref):uninstall
$datapack disable "$(path)"