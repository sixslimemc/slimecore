#> slimecore:_/impl/manifest/main
#--------------------
# @api
#--------------------

execute unless score *manifest_time _slimecore matches 1 run return -2

data modify storage slimecore:_ impl.manifest.new_entry.manifest set from storage slimecore:in manifest

execute store result score *x _slimecore run function slimecore:_/impl/evaluate/manifest/main

execute if score *x _slimecore matches 1 run data modify storage slimecore:_ manifests.valid append from storage slimecore:_ impl.manifest.new_entry
execute if score *x _slimecore matches 1 run data modify storage slimecore:_ manifests.valid[-1].pack_info set from storage slimecore:out manifest.value
execute if score *x _slimecore matches 1 run return 1

data modify storage slimecore:_ manifests.invalid append from storage slimecore:_ impl.manifest.new_entry
data modify storage slimecore:_ manifests.invalid[-1].error set from storage slimecore:out manifest.error

return -1