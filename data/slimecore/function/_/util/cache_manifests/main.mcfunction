#> slimecore :_/util/ cache_manifests
#--------------------
# -> manifests: [(PackManifest | any)]
#--------------------
# ...
#--------------------
# TODO: description
#--------------------
# 1.
#--------------------

data modify storage slimecore:_/out cache_manifests set value {}

execute if data storage slimecore:_/in cache_manifests.manifests[0] run function slimecore:_/util/cache_manifests/each

data remove storage slimecore:_ u.cache_manifests
data remove storage slimecore:_/in cache_manifests

return 1