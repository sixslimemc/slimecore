#> slimecore:_/impl/evaluate/manifest/main
#--------------------

# -> pack: PackID
# -> version: Version
# -> display_name: string
# -> url: string
# -> author: PackAuthor
# => abstract: bool = false
# => dependencies[]: &ManifestPackRequirement = []
# => supports[]: &ManifestPackRequirement = []
# => implements[]: PackID | PackReference = []
#--------------------
# <- value? PackInfo
# <- error?
#--------------------
# The manifest function.
#--------------------
# 1: valid manifest; >value< contains data.
# 0: invalid manifest; >error< contains data.
#--------------------

# TODO: validate that no dependencies/sups/impls are the pack itself

execute unless data storage slimecore:in manifest.abstract run data merge storage slimecore:in {manifest:{abstract:false}}
execute unless data storage slimecore:in manifest.dependencies run data merge storage slimecore:in {manifest:{dependencies:[]}}
execute unless data storage slimecore:in manifest.supports run data merge storage slimecore:in {manifest:{supports:[]}}
execute unless data storage slimecore:in manifest.implements run data merge storage slimecore:in {manifest:{implements:[]}}

data modify storage slimecore:_ impl.manifest.in set from storage slimecore:in manifest

# check required:
execute store result score *x _slimecore run function slimecore:_/impl/evaluate/manifest/require/do
execute unless score *x _slimecore matches 1.. run return run scoreboard players get *x _slimecore

# check valid data types:
execute store result score *x _slimecore run function slimecore:_/impl/evaluate/manifest/validate/do
execute unless score *x _slimecore matches 1.. run return run scoreboard players get *x _slimecore

# check duplicate deps:
execute store result score *x _slimecore run function slimecore:_/impl/evaluate/manifest/dupes/do.deps
execute unless score *x _slimecore matches 1.. run return run scoreboard players get *x _slimecore

# check duplicate impls:
execute store result score *x _slimecore run function slimecore:_/impl/evaluate/manifest/dupes/do.impls
execute unless score *x _slimecore matches 1.. run return run scoreboard players get *x _slimecore

# check impls contained in deps/sups:
execute store result score *x _slimecore run function slimecore:_/impl/evaluate/manifest/contains_impl/do
execute unless score *x _slimecore matches 1.. run return run scoreboard players get *x _slimecore

# datafix:
function slimecore:_/impl/evaluate/manifest/datafix/do

data modify storage slimecore:out manifest.value set from storage slimecore:_ impl.manifest.final

return 1