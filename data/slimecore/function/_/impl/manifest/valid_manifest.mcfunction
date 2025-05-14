#> slimecore:_/impl/manifest/valid_manifest
#--------------------
# ./main
#--------------------

# valid:
data modify storage slimecore:_ manifests.valid append value {}
data modify storage slimecore:_ manifests.valid[-1].input set from storage slimecore:in manifest
data modify storage slimecore:_ manifests.valid[-1].manifest set from storage slimecore:out pack_manifest.value

return 1