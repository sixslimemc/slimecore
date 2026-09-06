#> slimecore :-/ uninstall_slimecore/skip_confirm

data modify storage slimecore:_ v.uninstall.args set value {force:true}

function slimecore:_/impl/-/uninstall_slimecore/main

data remove storage slimecore:_ v.uninstall