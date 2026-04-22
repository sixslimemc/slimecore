#> slimecore :-/ uninstall_slimecore

# ensure $confirm = true.
$say $(confirm)
$data modify storage slimecore:_ x.confirm set value bool($(confirm))
execute unless data storage slimecore:_ x{confirm:true} run return fail

function slimecore:_/impl/-/uninstall_slimecore/main

return 1