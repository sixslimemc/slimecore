# UTIL > slimecore :_/util/ cache_manifests
# each
#--------------------
# ./main
#--------------------

data modify storage slimecore:_ u.cache_manifests.this_manifest set from storage slimecore:_/in cache_manifests.manifests[-1]

function slimecore:_/util/cache_manifests/each.1 with storage slimecore:_ u.cache_manifests.this_manifest

data remove storage slimecore:_/in cache_manifests.manifests[-1]
execute if data storage slimecore:_/in cache_manifests.manifests[0] run function slimecore:_/util/cache_manifests/each