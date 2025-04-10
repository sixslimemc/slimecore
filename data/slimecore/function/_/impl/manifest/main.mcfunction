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
# -> author: PackAuthor
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

data modify storage slimecore:_ impl.manifest.in set from storage slimecore:in manifest

# check required:
execute store result score *x _slimecore run function slimecore:_/impl/manifest/require/do
execute unless score *x _slimecore matches 1.. run return run scoreboard players get *x _slimecore

# validate data types:
execute store result score *x _slimecore run function slimecore:_/impl/manifest/validate/do
execute unless score *x _slimecore matches 1.. run return run scoreboard players get *x _slimecore

# check duplicate deps:
execute store result score *x _slimecore run function slimecore:_/impl/manifest/dupes/do.deps
execute unless score *x _slimecore matches 1.. run return run scoreboard players get *x _slimecore

# check duplicate impls:
execute store result score *x _slimecore run function slimecore:_/impl/manifest/dupes/do.impls
execute unless score *x _slimecore matches 1.. run return run scoreboard players get *x _slimecore

# check impls contained in deps/sups:
execute store result score *x _slimecore run function slimecore:_/impl/manifest/contains_impl/do
execute unless score *x _slimecore matches 1.. run return run scoreboard players get *x _slimecore

# transform data: