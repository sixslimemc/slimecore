#> slimecore:_/impl/manifest/main
#--------------------
# @api
#--------------------

# throw if not manifest time:
execute unless score *manifest_time _slimecore matches 1 run return -2

# evaluate:
data modify storage slimecore:in pack_manifest.input set from storage slimecore:in manifest
execute store result score *x _slimecore run function slimecore:evaluate/pack_manifest

# return if valid:
execute if score *x _slimecore matches 1 run return run function slimecore:_/impl/manifest/valid_manifest

# invalid:
data modify storage slimecore:_ manifests.invalid append from storage slimecore:in manifest
data modify storage slimecore:_ manifests.invalid[-1].error set from storage slimecore:out pack_manifest.error

return -1