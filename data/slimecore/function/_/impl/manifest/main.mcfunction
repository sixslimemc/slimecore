#> slimecore:_/impl/manifest/main
#--------------------
# @api
#--------------------

# throw if not manifest time:
execute unless score *manifest_time _slimecore matches 1 run return -2

data modify storage slimecore:_ impl.manifest.new_entry.manifest set from storage slimecore:in manifest

# evaluate:
execute store result score *x _slimecore run function slimecore:_/impl/evaluate/manifest/main

# return if valid:
execute if score *x _slimecore matches 1 run return run function slimecore:_/impl/manifest/valid_manifest

# invalid:
data modify storage slimecore:_ manifests.invalid append from storage slimecore:_ impl.manifest.new_entry
data modify storage slimecore:_ manifests.invalid[-1].error set from storage slimecore:out manifest.error

return -1