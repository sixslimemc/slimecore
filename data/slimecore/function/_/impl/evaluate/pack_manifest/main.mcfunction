# IMPL > slimecore : evaluate/pack_manifest
# main

# InputManifest := {
#     pack: $PackID
#     url: string
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

# dependencies type validation:
execute unless data storage slimecore:in pack_manifest.input.dependencies run data merge storage slimecore:in {pack_manifest:{input:{dependencies:[]}}}
data modify storage slimecore:_ v.pack_manifest.requirements set from storage slimecore:in pack_manifest.input.dependencies
execute store result score *pack_manifest.i _slimecore if data storage slimecore:_ v.pack_manifest.requirements[]
data merge storage slimecore:_ {v:{pack_manifest:{req_path:'dependencies'}}}
execute if data storage slimecore:_ v.pack_manifest.requirements[0] run function slimecore:_/impl/evaluate/pack_manifest/requirements/each

# supports type validation:
execute unless data storage slimecore:in pack_manifest.input.supports run data merge storage slimecore:in {pack_manifest:{input:{supports:[]}}}
data modify storage slimecore:_ v.pack_manifest.requirements set from storage slimecore:in pack_manifest.input.supports
execute store result score *pack_manifest.i _slimecore if data storage slimecore:_ v.pack_manifest.requirements[]
data merge storage slimecore:_ {v:{pack_manifest:{req_path:'supports'}}}
execute if data storage slimecore:_ v.pack_manifest.requirements[0] run function slimecore:_/impl/evaluate/pack_manifest/requirements/each

# implements type validation:
execute unless data storage slimecore:in pack_manifest.input.implements run data merge storage slimecore:in {pack_manifest:{input:{implements:[]}}}
data modify storage slimecore:_ v.pack_manifest.references set from storage slimecore:in pack_manifest.input.supports
execute store result score *pack_manifest.i _slimecore if data storage slimecore:_ v.pack_manifest.references[]
data merge storage slimecore:_ {v:{pack_manifest:{ref_path:'implements'}}}
execute if data storage slimecore:_ v.pack_manifest.references[0] run function slimecore:_/impl/evaluate/pack_manifest/references/each

# direct missings:
execute unless data storage slimecore:in pack_manifest.input.pack run data modify storage slimecore:out pack_manifest.error.missing_data append value {key:'pack'}
execute unless data storage slimecore:in pack_manifest.input.url run data modify storage slimecore:out pack_manifest.error.missing_data append value {key:'url'}
execute unless data storage slimecore:in pack_manifest.input.version run data modify storage slimecore:out pack_manifest.error.missing_data append value {key:'version'}
execute unless data storage slimecore:in pack_manifest.input.display.name run data modify storage slimecore:out pack_manifest.error.missing_data append value {key:'display.name'}
execute unless data storage slimecore:in pack_manifest.input.display.summary run data modify storage slimecore:out pack_manifest.error.missing_data append value {key:'display.summary'}
execute unless data storage slimecore:in pack_manifest.input.author.name run data modify storage slimecore:out pack_manifest.error.missing_data append value {key:'author.name'}

execute if data storage slimecore:out pack_manifest.error run return 0

