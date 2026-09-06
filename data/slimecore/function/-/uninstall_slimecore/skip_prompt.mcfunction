#> slimecore :-/ uninstall_slimecore/skip_prompt

data modify storage slimecore:_ v.uninstall.args set value {force:true}

function slimecore:_/impl/-/uninstall_slimecore/main

data remove storage slimecore:_ v.uninstall