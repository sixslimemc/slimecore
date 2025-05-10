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
#     expected_order? InputLoadOrdering
#     abstract? bool
#     library? bool
#     dependencies[]? InputPackRequirement
#     supports[]? InputPackRequirment
#     implements[]? InputPackReference
# }

# 'dependencies' evaluation:
execute unless data storage slimecore:in pack_manifest.input.dependencies run data merge storage slimecore:in {pack_manifest:{input:{dependencies:[]}}}
data modify storage slimecore:_ v.pack_manifest.requirements set from storage slimecore:in pack_manifest.input.dependencies
execute store result score *pack_manifest.i _slimecore if data storage slimecore:_ v.pack_manifest.requirements[]
data merge storage slimecore:_ {v:{pack_manifest:{req_path:'dependencies'}}}
execute if data storage slimecore:_ v.pack_manifest.requirements[0] run function slimecore:_/impl/evaluate/pack_manifest/requirements/each

# 'supports' evaluation:
execute unless data storage slimecore:in pack_manifest.input.supports run data merge storage slimecore:in {pack_manifest:{input:{supports:[]}}}
data modify storage slimecore:_ v.pack_manifest.requirements set from storage slimecore:in pack_manifest.input.supports
execute store result score *pack_manifest.i _slimecore if data storage slimecore:_ v.pack_manifest.requirements[]
data merge storage slimecore:_ {v:{pack_manifest:{req_path:'supports'}}}
execute if data storage slimecore:_ v.pack_manifest.requirements[0] run function slimecore:_/impl/evaluate/pack_manifest/requirements/each

# 'implements' evaluation:
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

# 'dependencies' list check:
data modify storage slimecore:_ v.pack_manifest.list_check set from storage slimecore:in pack_manifest.input.dependencies
execute store success score *x _slimecore run data modify storage slimecore:_ v.pack_manifest.list_check append value {}
execute if score *x _slimecore matches 0 run data modify storage slimecore:out pack_manifest.error.invalid_data append value {key:'dependencies', expected:'list of InputPackRequirement'}
execute if score *x _slimecore matches 0 run data modify storage slimecore:out pack_manifest.error.invalid_data[-1].got set from storage slimecore:in pack_manifest.input.dependencies

# 'supports' list check:
data modify storage slimecore:_ v.pack_manifest.list_check set from storage slimecore:in pack_manifest.input.supports
execute store success score *x _slimecore run data modify storage slimecore:_ v.pack_manifest.list_check append value {}
execute if score *x _slimecore matches 0 run data modify storage slimecore:out pack_manifest.error.invalid_data append value {key:'supports', expected:'list of InputPackRequirement'}
execute if score *x _slimecore matches 0 run data modify storage slimecore:out pack_manifest.error.invalid_data[-1].got set from storage slimecore:in pack_manifest.input.supports

# 'implements' list check:
data modify storage slimecore:_ v.pack_manifest.list_check set from storage slimecore:in pack_manifest.input.implements
execute store success score *x _slimecore run data modify storage slimecore:_ v.pack_manifest.list_check append value {}
execute if score *x _slimecore matches 0 run data modify storage slimecore:out pack_manifest.error.invalid_data append value {key:'implements', expected:'list of InputPackReference'}
execute if score *x _slimecore matches 0 run data modify storage slimecore:out pack_manifest.error.invalid_data[-1].got set from storage slimecore:in pack_manifest.input.implements

# 'pack' validation:
data modify storage slimecore:in pack_id.value set from storage slimecore:in pack_manifest.input.pack
execute store result score *x _slimecore run function slimecore:validate/component/pack_id
execute if score *x _slimecore matches 1 run data modify storage slimecore:out pack_manifest.value.pack set from storage slimecore:in pack_manifest.input.pack
execute if score *x _slimecore matches 0 run data modify storage slimecore:out pack_manifest.error.invalid_data append from storage slimecore:out pack_id.error.invalid_value
execute if score *x _slimecore matches 0 run data modify storage slimecore:out pack_manifest.error.invalid_data[-1].key set value 'pack'

# 'version' validation:
data modify storage slimecore:in version.value set from storage slimecore:in pack_manifest.input.version
execute store result score *x _slimecore run function slimecore:validate/component/version
execute if score *x _slimecore matches 1 run data modify storage slimecore:out pack_manifest.value.version set from storage slimecore:in pack_manifest.input.version
execute if score *x _slimecore matches 0 if data storage slimecore:out version.error.missing_data[0] run data modify storage slimecore:_ v.pack_manifest.missings set from storage slimecore:out version.error.missing_data
execute if score *x _slimecore matches 0 if data storage slimecore:out version.error.missing_data[0] run function slimecore:_/impl/evaluate/pack_manifest/each_missing
execute if score *x _slimecore matches 0 if data storage slimecore:out version.error.invalid_data[0] run data modify storage slimecore:_ v.pack_manifest.invalids set from storage slimecore:out version.error.invalid_data
execute if score *x _slimecore matches 0 if data storage slimecore:out version.error.invalid_data[0] run function slimecore:_/impl/evaluate/pack_manifest/each_invalid

# 'expected_order' evaluation:
data modify storage slimecore:in load_ordering.input set from storage slimecore:_ const.default_load_order