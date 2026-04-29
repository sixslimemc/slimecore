# IMPL > slimecore:rebuild
# disable
#--------------------
# ./closing_pass/each.1
# ./remaining_disables/each
#--------------------

$data modify storage slimecore:_ v.rebuild.call_disable set value bool($(call_tag))

# HOOK: meta_info/call/disable
$data modify storage slimecore:hook disable set value {pack_id:"$(pack_ref)"}
execute if data storage slimecore:_ v.rebuild{call_disable:true} run function #slimecore:hook/meta_info/call/disable

$execute if data storage slimecore:_ v.rebuild{call_disable:true} run function #$(pack_ref):disable
$datapack disable "$(path)"

$say datapack disable "$(path)"