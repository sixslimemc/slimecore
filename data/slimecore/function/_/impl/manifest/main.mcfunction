#> slimecore:_/impl/manifest/main
#--------------------
# @api
#--------------------
#> slimecore:manifest
#--------------------
# &PackOrderSpec := 'BEFORE' | 'AFTER' | 'ANY' | 1b | -1b | 0b
# &ManifestPackRequirement := { pack: PackID, version: {major: int, minor: int}, order: LoadSpec<&PackOrderSpec> }
# -> pack: PackID
# -> version: Version
# -> display_name: string
# -> url: string
# => abstract: bool = false
# => dependencies[]: &ManifestPackRequirement = []
# => supports[]: &ManifestPackRequirement = []
# => implements[]: PackID | PackProvision = []
#--------------------
# .
#--------------------
# The manifest function.
#--------------------
# .
#--------------------

execute unless data storage simecore:in manifest.abstract run data merge storage slimecore:in {manifest:{abstract:false}}
execute unless data storage simecore:in manifest.dependencies run data merge storage slimecore:in {manifest:{dependencies:[]}}
execute unless data storage simecore:in manifest.supports run data merge storage slimecore:in {manifest:{supports:[]}}
execute unless data storage simecore:in manifest.implements run data merge storage slimecore:in {manifest:{implements:[]}}

