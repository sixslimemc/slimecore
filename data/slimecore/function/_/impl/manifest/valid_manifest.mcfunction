#> slimecore:_/impl/manifest/valid_manifest
#--------------------
# ./main
#--------------------

# check if uninstalling:
execute store success score *x _slimecore run function slimecore:_/impl/manifest/check_uninstall_marked with storage slimecore:out manifest.value
execute if score *x _slimecore matches 1 run data modify storage slimecore:_ manifests.uninstalling append from storage slimecore:out manifest.value
execute if score *x _slimecore matches 1 run return -3

# valid:
data modify storage slimecore:_ manifests.valid append from storage slimecore:_ impl.manifest.new_entry
data modify storage slimecore:_ manifests.valid[-1].pack_info set from storage slimecore:out manifest.value

return 1