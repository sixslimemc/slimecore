# IMPL > slimecore:rebuild
# disable
#--------------------
# ./closing_pass/each.1
# ./remaining_disables/each
#--------------------

# HOOK: meta_info/call/disable
$data modify storage slimecore:hook disable set value {pack_ref:"$(pack_ref)"}
function #slimecore:hook/meta_info/call/disable

$data modify storage slimecore:_ x.call set value bool($(call_tag))
$execute if data storage slimecore:_ x{call:true} run function #$(pack_ref):disable
$datapack disable "$(path)"