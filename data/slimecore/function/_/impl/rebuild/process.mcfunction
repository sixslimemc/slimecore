# IMPL > slimecore:rebuild
# process
#--------------------
# ./main
#--------------------

# out init:
data modify storage slimecore:out rebuild.result set value {error:{}, success:{uninstalled:[], disabled:[], enabled:[]}}
scoreboard players set *rebuild.error _slimecore 0

# packs that are being enabled need to actually be re-enabled before manifest collection.
# bruh moment.

# gather manifests:
data modify storage slimecore:_ data.manifest_packs set value []
scoreboard players set *manifest_time _slimecore 1
function #slimecore:manifest
# DEBUG
function slimecore:_/test_manifests

scoreboard players set *manifest_time _slimecore 0

