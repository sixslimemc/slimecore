# IMPL > slimecore : evaluate/pack_manifest
# main

# InputManifest := {
#     pack: $PackID
#     version: Version
#     author: PackAuthor
#     display: {
#         name: string
#         summary: string
#     }
#     preferred_order? InputLoadOrdering
#     abstract? bool
#     library? bool
#     dependencies[]? InputPackRequirement
#     supports[]? InputPackRequirment
#     implements[]? InputPackReference
# }

# dependencies inner validation:
execute unless data storage slimecore:in pack_manifest.input.dependencies run data merge storage slimecore:in {pack_manifest:{input:{dependencies:[]}}}
data modify storage slimecore:_ v.pack_manifest.requirements set from storage slimecore:in pack_manifest.input.dependencies
execute store result score *pack_manifest.i _slimecore if data storage slimecore:_ v.pack_manifest.requirements[]
data merge storage slimecore:_ {v:{pack_manifest:{req_path:'dependencies'}}}
execute if data storage slimecore:_ v.pack_manifest.requirements[0] run function slimecore:_/impl/evaluate/pack_manifest/requirements/each

# supports inner validation:
execute unless data storage slimecore:in pack_manifest.input.supports run data merge storage slimecore:in {pack_manifest:{input:{supports:[]}}}
data modify storage slimecore:_ v.pack_manifest.requirements set from storage slimecore:in pack_manifest.input.supports
execute store result score *pack_manifest.i _slimecore if data storage slimecore:_ v.pack_manifest.requirements[]
data merge storage slimecore:_ {v:{pack_manifest:{req_path:'supports'}}}
execute if data storage slimecore:_ v.pack_manifest.requirements[0] run function slimecore:_/impl/evaluate/pack_manifest/requirements/each

# implements inner validation:
