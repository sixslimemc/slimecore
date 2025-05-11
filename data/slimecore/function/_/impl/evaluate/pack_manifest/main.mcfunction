# IMPL > slimecore : evaluate/pack_manifest
# main

#init arrays:
data merge storage slimecore:out {pack_manifest:{value:{dependencies:[], implements:[], supports:[]}}}

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
execute store success score *pack_manifest.ret _slimecore run data modify storage slimecore:_ v.pack_manifest.list_check append value {}
execute if score *pack_manifest.ret _slimecore matches 0 run data modify storage slimecore:out pack_manifest.error.invalid_data append value {key:'dependencies', expected:'list of InputPackRequirement'}
execute if score *pack_manifest.ret _slimecore matches 0 run data modify storage slimecore:out pack_manifest.error.invalid_data[-1].got set from storage slimecore:in pack_manifest.input.dependencies

# 'supports' list check:
data modify storage slimecore:_ v.pack_manifest.list_check set from storage slimecore:in pack_manifest.input.supports
execute store success score *pack_manifest.ret _slimecore run data modify storage slimecore:_ v.pack_manifest.list_check append value {}
execute if score *pack_manifest.ret _slimecore matches 0 run data modify storage slimecore:out pack_manifest.error.invalid_data append value {key:'supports', expected:'list of InputPackRequirement'}
execute if score *pack_manifest.ret _slimecore matches 0 run data modify storage slimecore:out pack_manifest.error.invalid_data[-1].got set from storage slimecore:in pack_manifest.input.supports

# 'implements' list check:
data modify storage slimecore:_ v.pack_manifest.list_check set from storage slimecore:in pack_manifest.input.implements
execute store success score *pack_manifest.ret _slimecore run data modify storage slimecore:_ v.pack_manifest.list_check append value {}
execute if score *pack_manifest.ret _slimecore matches 0 run data modify storage slimecore:out pack_manifest.error.invalid_data append value {key:'implements', expected:'list of InputPackReference'}
execute if score *pack_manifest.ret _slimecore matches 0 run data modify storage slimecore:out pack_manifest.error.invalid_data[-1].got set from storage slimecore:in pack_manifest.input.implements

# 'pack' validation:
data modify storage slimecore:in pack_id.value set from storage slimecore:in pack_manifest.input.pack
execute store result score *pack_manifest.ret _slimecore run function slimecore:validate/component/pack_id
execute if score *pack_manifest.ret _slimecore matches 1 run data modify storage slimecore:out pack_manifest.value.pack set from storage slimecore:in pack_manifest.input.pack
execute if score *pack_manifest.ret _slimecore matches 0 run data modify storage slimecore:out pack_manifest.error.invalid_data append from storage slimecore:out pack_id.error.invalid_value
execute if score *pack_manifest.ret _slimecore matches 0 run data modify storage slimecore:out pack_manifest.error.invalid_data[-1].key set value 'pack'

# 'version' validation:
data modify storage slimecore:in version.value set from storage slimecore:in pack_manifest.input.version
execute store result score *pack_manifest.ret _slimecore run function slimecore:validate/component/version
execute if score *pack_manifest.ret _slimecore matches 1 run data modify storage slimecore:out pack_manifest.value.version set from storage slimecore:in pack_manifest.input.version
execute if score *pack_manifest.ret _slimecore matches 0 if data storage slimecore:out version.error.missing_data[0] run data modify storage slimecore:_ v.pack_manifest.missings set from storage slimecore:out version.error.missing_data
execute if score *pack_manifest.ret _slimecore matches 0 if data storage slimecore:out version.error.missing_data[0] run function slimecore:_/impl/evaluate/pack_manifest/each_missing
execute if score *pack_manifest.ret _slimecore matches 0 if data storage slimecore:out version.error.invalid_data[0] run data modify storage slimecore:_ v.pack_manifest.invalids set from storage slimecore:out version.error.invalid_data
execute if score *pack_manifest.ret _slimecore matches 0 if data storage slimecore:out version.error.invalid_data[0] run function slimecore:_/impl/evaluate/pack_manifest/each_invalid

# 'expected_order' evaluation:
data modify storage slimecore:in load_ordering.input set from storage slimecore:_ const.default_expected_order
data modify storage slimecore:in load_ordering.input merge from storage slimecore:in pack_manifest.input.expected_order
execute store result score *pack_manifest.ret _slimecore run function slimecore:evaluate/component/load_ordering
execute if score *pack_manifest.ret _slimecore matches 1 run data modify storage slimecore:out pack_manifest.value.expected_order set from storage slimecore:out load_ordering.value
execute if score *pack_manifest.ret _slimecore matches 0 if data storage slimecore:out load_ordering.error.missing_data[0] run data modify storage slimecore:_ v.pack_manifest.missings set from storage slimecore:out load_ordering.error.missing_data
execute if score *pack_manifest.ret _slimecore matches 0 if data storage slimecore:out load_ordering.error.missing_data[0] run function slimecore:_/impl/evaluate/pack_manifest/each_missing
execute if score *pack_manifest.ret _slimecore matches 0 if data storage slimecore:out load_ordering.error.invalid_data[0] run data modify storage slimecore:_ v.pack_manifest.invalids set from storage slimecore:out load_ordering.error.invalid_data
execute if score *pack_manifest.ret _slimecore matches 0 if data storage slimecore:out load_ordering.error.invalid_data[0] run function slimecore:_/impl/evaluate/pack_manifest/each_invalid


# 'abstract' validation:
execute unless data storage slimecore:in pack_manifest.input.abstract run data merge storage slimecore:in {pack_manifest:{input:{abstract:false}}}
data modify storage slimecore:in bool.value set from storage slimecore:in pack_manifest.input.abstract
execute store result score *pack_manifest.ret _slimecore run function slimecore:validate/component/bool
execute if score *pack_manifest.ret _slimecore matches 1 run data modify storage slimecore:out pack_manifest.value.abstract set from storage slimecore:in pack_manifest.input.abstract
execute if score *pack_manifest.ret _slimecore matches 0 run data modify storage slimecore:out pack_manifest.error.invalid_data append from storage slimecore:out bool.error.invalid_value
execute if score *pack_manifest.ret _slimecore matches 0 run data modify storage slimecore:out pack_manifest.error.invalid_data[-1].key set value 'abstract'

# 'library' validation:
execute unless data storage slimecore:in pack_manifest.input.library run data merge storage slimecore:in {pack_manifest:{input:{library:false}}}
data modify storage slimecore:in bool.value set from storage slimecore:in pack_manifest.input.library
execute store result score *pack_manifest.ret _slimecore run function slimecore:validate/component/bool
execute if score *pack_manifest.ret _slimecore matches 1 run data modify storage slimecore:out pack_manifest.value.library set from storage slimecore:in pack_manifest.input.library
execute if score *pack_manifest.ret _slimecore matches 0 run data modify storage slimecore:out pack_manifest.error.invalid_data append from storage slimecore:out bool.error.invalid_value
execute if score *pack_manifest.ret _slimecore matches 0 run data modify storage slimecore:out pack_manifest.error.invalid_data[-1].key set value 'library'

execute if data storage slimecore:out pack_manifest.error run return 0

# duplicate requirements:
data modify storage slimecore:_ v.pack_manifest.dupe_checks set from storage slimecore:out pack_manifest.value.dependencies
data modify storage slimecore:_ v.pack_manifest.dupe_checks append from storage slimecore:out pack_manifest.value.supports[]
data merge storage slimecore:_ {v:{pack_manifest:{dupes:[], dupes_seen:[]}}}
execute if data storage slimecore:_ v.pack_manifest.dupe_checks[0] run function slimecore:_/impl/evaluate/pack_manifest/each_dupe_check
execute if data storage slimecore:_ v.pack_manifest.dupes[0] run data modify storage slimecore:out pack_manifest.error.duplicate_requirements set from storage slimecore:_ v.pack_manifest.dupes

# duplicate implements:
data modify storage slimecore:_ v.pack_manifest.dupe_checks set from storage slimecore:out pack_manifest.value.implements
data merge storage slimecore:_ {v:{pack_manifest:{dupes:[], dupes_seen:[]}}}
execute if data storage slimecore:_ v.pack_manifest.dupe_checks[0] run function slimecore:_/impl/evaluate/pack_manifest/each_dupe_check
execute if data storage slimecore:_ v.pack_manifest.dupes[0] run data modify storage slimecore:out pack_manifest.error.duplicate_implements set from storage slimecore:_ v.pack_manifest.dupes

# check unspecified implements:
data modify storage slimecore:_ util.difference.in.a set from storage slimecore:out pack_manifest.value.implements
data modify storage slimecore:_ util.difference.in.b set from storage slimecore:out pack_manifest.value.dependencies
data modify storage slimecore:_ util.difference.in.b append from storage slimecore:out pack_manifest.value.supports[]
data modify storage slimecore:_ util.difference.compare.only set value ['pack']
function slimecore:_/util/six/array/difference/main
execute if data storage slimecore:_ util.difference.out.unique_a[0] run data modify storage slimecore:out pack_manifest.error.unspecified_implements set from storage slimecore:_ util.difference.out.unique_a

# 'dependencies' selfref check:
data modify storage slimecore:_ v.pack_manifest.selfref_checks set from storage slimecore:out pack_manifest.value.dependencies
execute store result score *pack_manifest.i _slimecore if data storage slimecore:_ v.pack_manifest.selfref_checks[]
data merge storage slimecore:_ {v:{pack_manifest:{selfref_path:'dependencies'}}}
execute if data storage slimecore:_ v.pack_manifest.selfref_checks[0] run function slimecore:_/impl/evaluate/pack_manifest/selfref_checks/each

# 'supports' selfref check:
data modify storage slimecore:_ v.pack_manifest.selfref_checks set from storage slimecore:out pack_manifest.value.supports
execute store result score *pack_manifest.i _slimecore if data storage slimecore:_ v.pack_manifest.selfref_checks[]
data merge storage slimecore:_ {v:{pack_manifest:{selfref_path:'supports'}}}
execute if data storage slimecore:_ v.pack_manifest.selfref_checks[0] run function slimecore:_/impl/evaluate/pack_manifest/selfref_checks/each

# 'implements' selfref check:
data modify storage slimecore:_ v.pack_manifest.selfref_checks set from storage slimecore:out pack_manifest.value.implements
execute store result score *pack_manifest.i _slimecore if data storage slimecore:_ v.pack_manifest.selfref_checks[]
data merge storage slimecore:_ {v:{pack_manifest:{selfref_path:'implements'}}}
execute if data storage slimecore:_ v.pack_manifest.selfref_checks[0] run function slimecore:_/impl/evaluate/pack_manifest/selfref_checks/each

execute if data storage slimecore:out pack_manifest.error run return 0

return 1