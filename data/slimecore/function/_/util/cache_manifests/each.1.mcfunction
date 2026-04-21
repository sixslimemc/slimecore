# UTIL > slimecore :_/util/ cache_manifests
# each.1

$execute store success score *x _slimecore run data modify storage slimecore:_ data.cached_manifest_map.'$(pack_id)' set from storage slimecore:_ u.cache_manifests.this_manifest
execute if score *x _slimecore matches 0 run return 0

data modify storage slimecore:in pack.pack set from storage slimecore:_ u.cache_manifests.this_manifest
function slimecore:eval/pack

$data remove storage slimecore:_ data.cached_manifest_map.'$(pack_id)'
$execute if data storage slimecore:out pack.result.error run data modify storage slimecore:_ data.cached_manifest_map.'$(pack_id)'.error set from storage slimecore:out pack.result.error