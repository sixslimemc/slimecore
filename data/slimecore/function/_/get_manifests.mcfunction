#> slimecore:_/get_manifests
#--------------------
# _/impl/rebuild/process
# _/reload
#--------------------

# --- GET MANIFESTS ---
data modify storage slimecore:_ data.manifest_packs set value []
scoreboard players set *manifest_time _slimecore 1
function #slimecore:manifest
scoreboard players reset *manifest_time _slimecore
# ---

data modify storage slimecore:_/in cache_manifests.manifests set from storage slimecore:_ data.manifest_packs
function slimecore:_/util/cache_manifests/main