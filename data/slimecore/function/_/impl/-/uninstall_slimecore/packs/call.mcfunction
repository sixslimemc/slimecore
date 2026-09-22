# IMPL > slimecore:-/uninstall_slimecore
# packs/call
#--------------------
# ./each
#--------------------

# HOOK: call/disable
data modify storage slimecore:hook disable.pack_id set from storage slimecore:_ t.uninstall.this_pack.pack_id
function #slimecore:hook/call/disable

$function #$(pack_id):disable
$datapack disable "$(path)"