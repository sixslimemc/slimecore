#> slimecore :-/ uninstall_slimecore

$data modify storage slimecore:_ v.uninstall.args set value $(args)

function slimecore:_/impl/-/uninstall_slimecore/main

data remove storage slimecore:_ v.uninstall