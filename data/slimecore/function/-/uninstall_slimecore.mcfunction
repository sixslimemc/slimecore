#> slimecore :-/ uninstall_slimecore

# ensure $confirm = true.
$say $(confirm)
$data modify storage slimecore:_ x.confirm set value $(confirm)b
execute unless data storage slimecore:_ x{confirm:true} run return fail

function slimecore:_/get_manifests

return 1