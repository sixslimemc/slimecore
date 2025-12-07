# IMPL > slimecore:api/manifest
# main

execute unless score *manifest_time _slimecore matches 1 run return 0
data modify storage slimecore:_ data.packs append from storage slimecore:in manifest.pack
return 1