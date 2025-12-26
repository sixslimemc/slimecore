# IMPL > slimecore:rebuild
# uninstall
#--------------------
# ./closing_pass/each.1
# ./remaining_uninstalls/each
#--------------------

$data modify storage slimecore:hook uninstall set value {pack_ref:"$(pack_ref)"}
function #slimecore:hook/info/rebuild/call/uninstall

$function #$(pack_ref):uninstall
$datapack disable "$(path)"