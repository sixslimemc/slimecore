#> slimecore:_/build/main
#--------------------
# _/reload
#--------------------

# gather manifests:
data modify storage slimecore:_ data.packs set value []
scoreboard players set *manifest_time _slimecore 1
function #slimecore:manifest
scoreboard players set *manifest_time _slimecore 0