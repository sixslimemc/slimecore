# IMPL > util/get_manifest
# main

$data modify storage slimecore:_ v.get_manifest.entry set from storage slimecore:_ data.cached_manifest_map.'$(author_id).$(pack_id)'
execute unless data storage slimecore:_ v.get_manifest.entry run return 0

data modify storage slimecore:out get_manifest.manifest set from storage slimecore:_ v.get_manifest.entry.manifest
data modify storage slimecore:out get_manifest.error set from storage slimecore:_ v.get_manifest.entry.error

return 1