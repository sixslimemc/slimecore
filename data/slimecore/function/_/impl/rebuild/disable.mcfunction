# IMPL > slimecore:rebuild
# disable
#--------------------
# ./closing_pass/each.1
# ./remaining_disables/each
#--------------------
# does not disable pack if {..disable_from_uninstall} == true

$data modify storage slimecore:_ v.rebuild.call_tag set value bool($(call_tag))

# HOOK: meta_info/call/pre/disable
$data modify storage slimecore:hook disable set value {pack_id:"$(pack_ref)"}
execute if data storage slimecore:_ v.rebuild{call_tag:true} run function #slimecore:hook/meta_info/call/pre/disable
data remove storage slimecore:hook disable

$execute if data storage slimecore:_ v.rebuild{call_tag:true} run function #$(pack_ref):disable

# HOOK: meta_info/call/post/disable
$data modify storage slimecore:hook disable set value {pack_id:"$(pack_ref)"}
execute if data storage slimecore:_ v.rebuild{call_tag:true} run function #slimecore:hook/meta_info/call/post/disable
data remove storage slimecore:hook disable

$execute unless data storage slimecore:_ v.rebuild{disable_from_uninstall:true} run datapack disable "$(path)"