#> slimecore : eval/get/standard_datapack_paths
# main

data modify storage slimecore:_ x.macro set from storage slimecore:in standard_datapack_paths.pack_info
data modify storage slimecore:_ x.macro merge from storage slimecore:in standard_datapack_paths.pack_info.version
function slimecore:_/impl/eval/get/standard_datapack_paths/set with storage slimecore:_ x.macro

return 1