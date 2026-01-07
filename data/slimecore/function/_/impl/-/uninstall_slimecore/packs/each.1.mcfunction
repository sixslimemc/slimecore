# IMPL > slimecore:-/uninstall_slimecore
# packs/each.1

$execute unless data storage slimecore:data build.aux.pack_map."$(pack_ref)" run return 0

$tellraw @s [{text:"Disabling pack: ", color:"gray"}, {text:"$(pack_ref)", color:"dark_aqua", bold:true}, {text:" ($(path))", color:"dark_gray"}]

$function #$(pack_ref):disable
$datapack disable "$(path)"